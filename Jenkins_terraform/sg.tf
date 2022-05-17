resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "jenkinstaskkkk" {

name = "jenkinstaskkkk"
description = "allow ports"
vpc_id = aws_default_vpc.default.id

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 2222
    to_port          = 2222
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
egress {

from_port = 0
to_port = 0
protocol = -1
cidr_blocks = ["0.0.0.0/0"]
}
}
