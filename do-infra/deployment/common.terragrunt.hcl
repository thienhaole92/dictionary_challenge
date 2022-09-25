locals {
  account     = read_terragrunt_config(find_in_parent_folders("account.terragrunt.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.terragrunt.hcl"))
  environment = read_terragrunt_config(find_in_parent_folders("environment.terragrunt.hcl"))
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

# Generate backend block
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    access_key                  = "${local.account.locals.access_key}"
    secret_key                  = "${local.account.locals.secret_key}"
    endpoint                    = "${local.account.locals.bucket_endpoint}"
    bucket                      = "${local.account.locals.bucket}"
    region                      = "${local.region.locals.aws_region}"
    key                         = "${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}

# Generate required providers block
generate "required_providers" {
  path      = "required_providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.21.0"
    }
  }
}
EOF
}

# Generate provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "digitalocean" {
  token = "${local.account.locals.do_token}"
}
EOF
}