git init
git add .
git commit -m "Initial commit"
git branch -M main        # rename to main
git remote add origin https://github.com/shekar1221/terraform_aws_project.git
git push -u origin main


project-root/
├── backend.tf           # Backend configuration
├── provider.tf          # Provider configurations
├── variables.tf         # Input variable definitions
├── locals.tf           # Local value definitions
├── main.tf             # Main resource definitions
├── vpc.tf              # VPC-related resources
├── security.tf         # Security groups, NACLs
├── compute.tf          # EC2, Auto Scaling, etc.
├── storage.tf          # S3, EBS, EFS resources
├── database.tf         # RDS, DynamoDB resources
├── outputs.tf          # Output definitions
├── terraform.tfvars   # Variable values
└── README.md           # Documentation

terraform init - Initialize the working directory
terraform validate - Validate the configuration files
terraform plan - Create an execution plan
terraform apply - Apply the changes to reach desired state
terraform destroy - Destroy the infrastructure when needed

# List resources in state
terraform state list

# Show detailed state information
terraform state show <resource_name>

# Remove resource from state (without destroying)
terraform state rm <resource_name>

# Move resource to different state address
terraform state mv <source> <destination>

# Pull current state and display
terraform state pull

# Initialize with new backend configuration
terraform init

# Terraform will prompt to migrate existing state
# Answer 'yes' to copy existing state to new backend

# Verify state is now remote
terraform state list