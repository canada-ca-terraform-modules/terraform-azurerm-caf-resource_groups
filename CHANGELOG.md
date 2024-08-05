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
