


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

**Error:**  You might get the following error if you have not finished connecting your AWS account to GitHub:

```
Error: error waiting for App Runner Service  creation: unexpected state 'CREATE_FAILED', wanted target 'RUNNING'. last error: %!s(<nil>)
```

**Solution:** This problem is due to an uncompleted handshake between AWS and Github. Go to the AWS App Runner console and click on Github Connections. 
The connection you created for this application will be there showing status ```Pending Handshake```. Select that connection and click the ```Complete Handshake``` button. After that you can try to redeploy the application again.

## Variables

* ```AWS_REGION```: The AWS Region where to deploy the application. Currently only 5 regions are supported (us-east-1, us-east-1, us-west-2, ap-northeast-1, eu-west-1) Default: ```us-east-1```.
* ```AWS_PROFILE```: AWS Profile to use for the deployment. Default: ```default```
* ```PUBLIC_SUBNET_AVAILABILITY_ZONE```: Availability zone of the subnet where the app runner application is going to be deployed. Default: ```us-east-1a```
* ```APPRUNNER_SERVICE_NAME```: The name that you would like to give to the service. Mainly for recognize it within the AWS console. No default
* ```APPRUNNER_CONNECTION_NAME```: The name of the connection to the software repo provider. Currently App Runner only support connections to GitHub.
* ```APPRUNNER_CODE_REPO```: The URL of the repo where to pull the code from.
* ```APPRUNNER_CODE_BUILD_COMMAND```: The commands to build the application. e.g: In case of react it would be ```npm install && npm run build ```
* ```APPRUNNER_CODE_START_COMMAND```: The command or set of command to start the applicaiton. e.g: In case of react it would be ```npm start```
* ```APPRUNNER_CODE_RUNETIME```: The runtime needed to run the applications. Accepted values: PYTHON_3, NODEJS_12, NODEJS_14, NODEJS_16, CORRETTO_8, CORRETTO_11, GO_1, DOTNET_6, PHP_81, RUBY_31
* ```APPRUNNER_CODE_PORT```: The port where the application is listening. Default: ```3000```
* ```APPRUNNER_CODE_RUNTIME_ENVIRONMENT_VARIABLES```: A map of environment variables to be passed to the application.