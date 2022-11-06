/*
Copyright (c) 2021-2022 Epiphyte LLC

Author: Fernandez-Alcon, Jose
E-mail: jose@epiphyte.io
*/

//App Runner Connection is the block that connects and authenticates the AWS with
//Github to pull the source code from
//NOTE: After creation, you must complete the authentication handshake using the App Runner console.
resource "aws_apprunner_connection" "connection" {
  connection_name = var.APPRUNNER_SERVICE_NAME
  provider_type   = "GITHUB"

  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}

resource "aws_apprunner_vpc_connector" "connector" {
  vpc_connector_name = var.APPRUNNER_SERVICE_NAME
  subnets            = [aws_subnet.public_subnet.id]
  security_groups    = [aws_security_group.SG.id]
}


resource "aws_apprunner_service" "service" {
  depends_on = [aws_apprunner_connection.connection, aws_apprunner_vpc_connector.connector]
  service_name = var.APPRUNNER_SERVICE_NAME

  source_configuration {
    authentication_configuration {
      connection_arn = aws_apprunner_connection.connection.arn
    }
    code_repository {
      code_configuration {
        code_configuration_values {
          build_command = var.APPRUNNER_CODE_BUILD_COMMAND
          port          = var.APPRUNNER_CODE_PORT
          runtime       = var.APPRUNNER_CODE_RUNTIME
          start_command = var.APPRUNNER_CODE_START_COMMAND
        }
        configuration_source = "API"
      }
      repository_url = var.APPRUNNER_CODE_REPO
      source_code_version {
        type  = "BRANCH"
        value = var.APPRUNNER_CODE_BRANCH_NAME
      }
    }
  }

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.connector.arn
    }
  }

  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}

output "service_url" {
  value = aws_apprunner_service.service.service_url
}