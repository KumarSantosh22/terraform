# Init
terraform init

# Plan
terraform plan
terraform plan --out tfplan
terraform show -json tfplan
terraform show -json tfplan >> tfplan.json

# Apply
terraform apply tfplan
terraform apply -state terraform.tfstatef

# apply with variables
# terraform apply -v "rg-name=abc" OR
terraform apply -var-file terraform.tfvars

# Destroy