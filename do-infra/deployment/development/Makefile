validate:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;
	terragrunt run-all init -input=false
	terragrunt run-all validate
	terragrunt run-all plan -input=false -no-color -out=tfplan

apply:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
	find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;
	terragrunt run-all init -input=false
	terragrunt run-all validate
	terragrunt run-all plan -input=false -no-color -out=tfplan
	echo "y" | terragrunt run-all apply -input=false -no-color tfplan