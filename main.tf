locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags       = merge(var.tags, local.module_tag)
  env_4      = substr(var.env, 0, 4)
  name-regex = "/[^0-9A-Za-z-_.]/" # Anti-pattern to match all characters not in: 0-9 a-z A-Z -
}