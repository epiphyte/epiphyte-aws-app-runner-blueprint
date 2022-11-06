/*
Copyright (c) 2021-2022 Epiphyte LLC

Author: Fernandez-Alcon, Jose
E-mail: jose@epiphyte.io
*/

provider "aws" {
  profile = var.AWS_PROFILE //Profile name of the aws profile on ~/.aws/credentials
  region = var.AWS_REGION //The region where the webapp needs to be deployed
}

# Uncomment to store the state in S3 rather than locally
#terraform {
#  backend "s3" {
#    bucket = "epiphyte-blueprints-terraform-state"
#    key = "app-runner-blueprint"
#    region= "us-east-1"
#  }
#}
