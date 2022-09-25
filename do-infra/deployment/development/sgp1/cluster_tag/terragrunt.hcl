locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
}

include "common" {
  path = find_in_parent_folders("common.terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/tag"
}

inputs = {
  project_name = "${local.common_vars.locals.project_name}"
  environment  = "${local.environment.locals.environment}"
  name         = "cluster"
}
