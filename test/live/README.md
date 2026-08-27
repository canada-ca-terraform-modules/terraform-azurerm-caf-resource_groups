# `test/live/` - live-test harness

A live, real-Azure-resource harness used by the `live-test` PR check (see
the [`live-test-actions`](https://github.com/canada-ca-terraform-modules/live-test-actions)
repo and this module's own `.github/workflows/live-test.yml` once it lands)
to prove that an open PR doesn't destroy or replace a resource a real
consumer already has running. It is **not** a substitute for the module's
other test surface:

- **`tests/*.tftest.hcl`** - mock-based unit tests (`terraform test`, no
  provider credentials, no live Azure resources). Covers naming, defaults,
  and validation logic on every PR via `terraform-ci.yml`. Run these first;
  they're fast and free.
- **`ESLZ/`** - a usage example showing the map-based blueprint pattern
  consumers actually wire this module into. Not exercised by CI;
  documentation only.
- **`test/live/`** (this directory) - a single, real instance of the module
  applied against a disposable Azure sandbox subscription. Used by CI to
  diff the PR's plan against a live baseline, and can be run manually by a
  maintainer the same way.

## What's here

| File | Purpose |
|---|---|
| `main.tf` | Module block with `source = "../../"` (a relative path, not a pinned `?ref` - "baseline" and "PR" are just two on-disk checkouts of this repo), the `azurerm` provider config, and an empty `backend "local" {}` block (path supplied at `init` time - see below). |
| `variables.tf` | `env`, `location` (defaults to `canadacentral`), `group`, `project`, `tags`, and `pr_number` (defaults to `"manual"`). |
| `config/resource_groups.tfvars` | One representative real-usage fixture: a single resource group with standard naming fields. |

No `test_dependencies.tf` - this module creates a resource group directly
and has no upstream dependencies beyond Contributor on the subscription.

No Terragrunt anywhere under this directory - a single harness per repo has
no cross-harness DRY need.

## Running it manually

Requires your own `az login` session against the sandbox subscription (CI
uses OIDC instead).

```bash
cd test/live
terraform init
terraform plan  -var-file=config/resource_groups.tfvars
terraform apply -var-file=config/resource_groups.tfvars
```

Confirm only `module.resource_groups` is planned/applied, then tear it down:

```bash
terraform destroy -var-file=config/resource_groups.tfvars
```

No `.tfstate` file is ever committed under `test/live/` - every run is
fully ephemeral, whether run by CI or by hand.

## Two-checkout state isolation (baseline vs. PR)

CI proves a PR isn't a breaking change by applying the target branch as a
live baseline, then plan/apply-ing the PR branch's checkout of this same
harness against that same live state - two on-disk checkouts of this repo,
one shared external state file, no state copying between them:

```bash
STATE=$RUNNER_TEMP/live-test-<pr-number>.tfstate

# 1. Baseline apply, from B (target branch).
cd B/test/live
terraform init -backend-config="path=$STATE"
terraform apply -var-file=config/resource_groups.tfvars -var="pr_number=<pr-number>"

# 2. PR plan (and, in CI, apply), from A, against the same state file.
cd A/test/live
terraform init -backend-config="path=$STATE"
terraform plan -var-file=config/resource_groups.tfvars -var="pr_number=<pr-number>"

# 3. Always tear down from A once the run finishes.
terraform destroy -var-file=config/resource_groups.tfvars -var="pr_number=<pr-number>"
```

`pr_number` (`TF_VAR_pr_number` in CI, sourced from `github.event.number`)
suffixes the `userDefinedString`, so two concurrently open PRs against this
module never collide on the same sandbox resource group name.
