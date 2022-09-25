locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.terragrunt.hcl"))
}

include "common" {
  path = find_in_parent_folders("common.terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/firewall"
}

dependency "project" {
  config_path                             = find_in_parent_folders("project")
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"

  mock_outputs = {
    name = "temporary-dummy-data"
  }
}

dependency "cluster_tag" {
  config_path                             = find_in_parent_folders("cluster_tag")
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"

  mock_outputs = {
    id = "temporary-dummy-data"
  }
}

inputs = {
  project_name = dependency.project.outputs.name
  environment  = "${local.environment.locals.environment}"
  cluster_tags = [dependency.cluster_tag.outputs.id]
}
