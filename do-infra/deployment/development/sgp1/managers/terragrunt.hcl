locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.terragrunt.hcl"))
}

include "common" {
  path = find_in_parent_folders("common.terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/managers"
}

dependency "vpc" {
  config_path                             = find_in_parent_folders("vpc")
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"

  mock_outputs = {
    id = "temporary-dummy-data"
  }
}

dependency "ssh_key" {
  config_path                             = find_in_parent_folders("ssh_key")
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"

  mock_outputs = {
    fingerprint = "temporary-dummy-data"
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

dependency "manager_tag" {
  config_path                             = find_in_parent_folders("manager_tag")
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"

  mock_outputs = {
    id = "temporary-dummy-data"
  }
}

inputs = {
  project_name    = "${local.common_vars.locals.project_name}"
  environment     = "${local.environment.locals.environment}"
  region          = "${local.region.locals.region}"
  image           = "ubuntu-20-04-x64"
  total_instances = 1
  name            = "manager"
  size            = "s-2vcpu-2gb-amd"
  ssh_keys        = [dependency.ssh_key.outputs.fingerprint]
  vpc_uuid        = dependency.vpc.outputs.id
  tags            = [dependency.cluster_tag.outputs.id, dependency.manager_tag.outputs.id]
}
