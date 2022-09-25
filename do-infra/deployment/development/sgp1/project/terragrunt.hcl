locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  region      = read_terragrunt_config(find_in_parent_folders("region.terragrunt.hcl"))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
}

include "common" {
  path = find_in_parent_folders("common.terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/project"
}

inputs = {
  name        = "${local.common_vars.locals.project_name}"
  description = "A project to represent development resources."
  purpose     = "Supper application can run on Docker Swarm"
  environment = "${local.environment.locals.environment}"
}
