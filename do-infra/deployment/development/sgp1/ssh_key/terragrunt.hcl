locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
}

include "common" {
  path = find_in_parent_folders("common.terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/ssh_key"
}

inputs = {
  project_name = "${local.common_vars.locals.project_name}"
  environment  = "${local.environment.locals.environment}"
  name         = "haole"
  public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcZERUjZzAsirxQHQJGI/sZCvJTNaOgM1CqToXL9wIH4dcshl6msBMfY4h8TG8XGD1WLIneoE7ASQi24UTNSEW6Zk8EAPxJq1eLZ+IixdaO2PDWYs6PsAC8wIDbzDEqkBIg3SwLkCP00/VdC7P9foKkGJGjsiE/BV2i5OZjLSXZchASgPDeI91D+25Q5IhzJhzxX9pBIY+JRpv+YKsWOMEHBmXsm5JEHA2pOCe4Hse2A4wbI4aq/6/Aheh0ZWbhR4Xrs8xKuI9MH2IGl9PTQtUmcQrksXD+vndYeHuypCVHMFDG5Lt9Br6tUpiQxRyOJCK8EIbN2UOqm43IeeaSVksO+7XDt5rL1mEk9FLRPVaPuzAwN5xmsK6qGzXqOYFho6pYNkJVFClbiGscQ+3O7JK85it5BaMxTxeQ9D0Q5PXPo0gPT7WFQFb9oDp2K16cbEfjDfEnsCtTI51P1MbVnQVkQ6M+chJME/mwyzm8ttP3WBbv3QUGJnEiAkIMvMFx60= haole@Haos-MBP-2"
}
