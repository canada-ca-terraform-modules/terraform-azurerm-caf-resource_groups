# config/resource_groups.tfvars
# Tracked, ready-to-run fixture for the test/live harness - one representative
# real-usage instance, not a dormant "_" template.
#
# This module creates a resource group directly - no external dependency
# resources needed. Only Contributor on the sandbox subscription is required.
#
# Maintained by whoever adds a new optional input to the module: update this
# file in the same PR if you want live coverage of it.

env      = "livetest"
group    = "yourgroup"
project  = "yourproject"
location = "canadacentral"
