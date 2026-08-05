## v2.2.0 (Aug 5 2026)

Upgrade to azurerm provider ~> 5.0 (target: 5.0.1).

Added:
- `providers.tf` pinning `azurerm ~> 5.0` and `required_version >= 1.9`
- `.tflint.hcl` with `call_module_type = "local"`
- `.gitattributes` enforcing LF line endings
- `tests/resource_group.tftest.hcl` and `tests/upgrade_compat.tftest.hcl` (mock_provider, no Azure credentials needed)
- `.github/workflows/terraform-ci.yml` (fmt, init, validate, test, tflint on every PR)
- `.github/workflows/release.yml` (creates a GitHub release on merge, tagged from `ESLZ/resourcegroups.tf`'s `?ref=`)

Changed:
- `.gitignore` replaced with the standard template; `*.tfvars` is now ignored except `ESLZ/*.tfvars`
- Bumped `.github/workflows/documentation.yml` action pins (`actions/checkout` v7.0.1, `terraform-docs/gh-actions` v1.4.1)
- Bumped `ESLZ/resourcegroups.tf` module ref to `v2.2.0`

Notes:
- `azurerm_resource_group`'s schema (`name`, `location`, `managed_by`, `tags`) is unchanged between azurerm 3.x/4.x/5.0.1 — no code changes were required to `module.tf`, `variables.tf`, `locals.tf`, or `names.tf`. This upgrade is artifact/tooling-only (provider pin, tests, CI).
- No breaking changes, no `moved` blocks needed, no removed variables to restore.
- PR #4 review follow-up: SHA-pinned every `uses:` action reference in `terraform-ci.yml`, `documentation.yml`, and `release.yml` (with a version comment alongside each) for supply-chain security; added `timeout-minutes: 15` to the `terraform-ci.yml` job; added `env_longer_than_4_chars_is_truncated` test coverage for the `env_4 = substr(var.env, 0, 4)` truncation path; strengthened `long_user_defined_string_is_truncated` with a `startswith` prefix assertion so it can't pass on an empty/mangled name.

## v2.1.0 (Feb 4 2024)
- Add support for optional customName for resource group
- Add support for optional managed_by parameter
- Remove useless test code
- Add auto documentation pipeline

## v2.0.0 (Aug 2024)
New module standard

IMPROVEMENTS: 
* Create resource groups in tfvars file
* No need to input env and project field in the name. Only userDefinedString is required

MANUAL INTERVENTION: \
To update to the new version, the following steps must be done:

* Replace the resourcegroup.tf file in the project by the ESLZ/resourcegroups.tf file
* Add the content of ESLZ/resourcegroups.tfvars to the tfvars file of your project or add the file to the config folder of
the landing zone
* Add the resource groups of your project in the new tfvars file, only including the userDefinedString portion of the name in the 
key of the object, i.e DNS, Management, Project

## v1.1.0 (Aug 2020)

FEATURES: 
* Made it terraform 0.13 compliant

IMPROVEMENTS:

BUGS:


## v1.0.0 (June 2020)

FEATURES: 
* **new feature:**  Initial release

IMPROVEMENTS:

BUGS:
