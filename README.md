# Epiphhyte AWS App Runner Blueprint

Blueprint to deploy an application on AWS App Runner using terraform


## Deployment

1. Create a bucket in S3 to store the terraform state
2. Move dev.tfvars.example to dev.tfvars and fill in the variables
3. make init to initialize terraform and the two environments (prod and dev)
4. make plan_dev to see what will be deployed
5. make deploy_dev to deploy the application

