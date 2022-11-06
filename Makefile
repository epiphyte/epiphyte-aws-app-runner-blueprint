# Copyright (c) 2021-2022 Epiphyte LLC
#
# Author: Fernandez-Alcon, Jose
# E-mail: jose@epiphyte.io
#

AWS_PROFILE_NAME:=default

init:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform init
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace new prod
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace new dev

## Development
plan_dev:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select dev
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform plan -var-file=dev.tfvars

deploy_dev:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select dev
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform apply -var-file=dev.tfvars

destroy_dev:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select dev
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform destroy -var-file=dev.tfvars


## Production
plan_prod:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select prod
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform plan -var-file=prod.tfvars

deploy_prod:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select prod
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform apply -var-file=prod.tfvars

destroy_prod:
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform workspace select prod
	AWS_PROFILE=$(AWS_PROFILE_NAME) terraform destroy -var-file=prod.tfvars