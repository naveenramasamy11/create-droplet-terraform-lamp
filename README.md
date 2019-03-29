## create-droplet-terraform-lamp ##


 `A droplet is provisioned using terraform and provisioner section is of ansible which sets up a simple lamp stack with right ports allowed.`
 
 _$ terraform init_
 * First, initialize Terraform for your project. This will read your configuration files and install the plugins for your provider:
 
 
 _$ terraform plan -var-file=droplet.tfvars_ 
 
 * You may now begin working with Terraform. Create a `tfvar` file of necessary variables and run the above command to see any changes that are required for your infrastructure. All Terraform commands should now work.
