


![Epiphyte Logo](https://epiphyte.io/images/Epiphyte_Logo_Black.png)



# Epiphyte AWS App Runner Blueprint

Blueprint to deploy an application on AWS App Runner using terraform

## Deployment

1. Install the [AWS Connector for Github](https://github.com/apps/aws-connector-for-github). This is necessary 
for AWS to able to pull the code of the application you want to deploy.
1. Copy ```dev.tfvars.example``` to ```dev.tfvars``` and fill in the variables
2. ```make init``` to initialize terraform and the two environments (prod and dev)
3. ```make deploy_dev``` to deploy the application

## Troubleshooting

**Error:**  You might get the following error if you have not finished connecting your AWS account to Github:

```
Error: error waiting for App Runner Service  creation: unexpected state 'CREATE_FAILED', wanted target 'RUNNING'. last error: %!s(<nil>)
```

**Solution:** This problem is due to an uncompleted handshake between AWS and Github. Go to the AWS App Runner console and click on Github Connections. 
The connection you created for this application will be there showing status ```Pending Handshake```. Select that connection and click the ```Complete Handshake``` button. After that you can try to redeploy the application again.

