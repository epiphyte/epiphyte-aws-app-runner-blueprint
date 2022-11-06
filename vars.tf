/*
Copyright (c) 2021-2022 Epiphyte LLC

Author: Fernandez-Alcon, Jose
E-mail: jose@epiphyte.io
*/

## Cloud Resource Tagging Variables

#Project tag name
variable "PROJ" {
  type = string
}

#Resource contact name
variable "CONTACT" {
  type = string
}

#Project status
variable "STATUS" {
  type = string
}

### Deployment Specific Variables ==========================

#AWS Region
variable "AWS_REGION" {
  type = string
  default = "us-east-1"
}

#AWS Profile
variable "AWS_PROFILE" {
  type = string
}



### App Runner Deployment Vars ==========================

//The name we would like to give the service we are deploying
variable "APPRUNNER_SERVICE_NAME" {
  type = string
}

//The name we would like to give to the connection to the code repository
variable "APPRUNNER_CONNECTION_NAME" {
  type = string
}

//The URL of the source code repository
//e.g https://github.com/epiphyte/example-app
variable "APPRUNNER_CODE_REPO" {
  type = string
}

//The command or set of commands needed to run build the application
variable "APPRUNNER_CODE_BUILD_COMMAND" {
  type = string
  default = "npm install && npm run build"
}

//The command or set of commands needed to run the application
variable "APPRUNNER_CODE_START_COMMAND" {
  type = string
  default = "npm start"
}


//The port in which the application will be running
variable "APPRUNNER_CODE_PORT" {
  type = string
}

//The runtime needed to run the application
//Accepted values: PYTHON_3, NODEJS_12, NODEJS_14, NODEJS_16, C
//ORRETTO_8, CORRETTO_11, GO_1, DOTNET_6, PHP_81, RUBY_31
variable "APPRUNNER_CODE_RUNTIME" {
  type = string
  default = "NODEJS_14"
}

//The name of the branch from which the code will be pulled
variable "APPRUNNER_CODE_BRANCH_NAME" {
    type = string
    default = "main"
}

//The variables needed to run the application
variable "APPRUNNER_CODE_RUNTIME_ENVIRONMENT_VARIABLES" {
  type = map(string)
  default = {}
}