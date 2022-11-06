/*
Copyright (c) 2021-2022 Epiphyte LLC

Author: Fernandez-Alcon, Jose
E-mail: jose@epiphyte.io
*/


//Description of the security group
resource "aws_security_group" "SG" {
  name        = "SG"
  description = "Blueprint Security Group"
  vpc_id      = aws_vpc.VPC.id


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}


output "SG_id" {
  value = aws_security_group.SG.id
}