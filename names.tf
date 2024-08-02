# This locals implement the resource correct names based on GC CAF naming convention rules

locals {
  postfix = "-rg"
  env_4      = substr(var.env, 0, 4) # Make sure env lenght does not exceed 4
  regex = "/[^0-9A-Za-z-_.]/" # Anti-pattern to match all characters not in: 0-9, a-z, A-Z, -, _, .
  userDefinedStringPrefix = "${var.group}_${var.project}"
  userDefinedString_replaced = replace(var.userDefinedString, "-", "_")
  name = substr(replace("${local.env_4}-${local.userDefinedStringPrefix}_${local.userDefinedString_replaced}${local.postfix}", local.regex, ""), 0, 90)
}