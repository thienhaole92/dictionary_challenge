# Dictionary App Infrastructure

The application is running in a Docker Swarm cluster on DigitalOcean

To provision infrastructure we need to set environment variables:

```bash
export SPACES_SECRET_KEY=xx
export SPACE_BUCKET_NAME=dict-app
export DO_TOKEN=xx
export SPACE_BUCKET_ENDPOINT=sgp1.digitaloceanspaces.com
export SPACES_ACCESS_KEY=xxx
```

Then run commands:

```bash
find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;
terragrunt run-all init -input=false
terragrunt run-all validate
terragrunt run-all plan -input=false -no-color -out=tfplan
echo "y" | terragrunt run-all apply -input=false -no-color tfplan
```