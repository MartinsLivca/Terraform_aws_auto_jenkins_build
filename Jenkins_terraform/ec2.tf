
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  iam_instance_profile = "jenkins_role"
  key_name        = "cfjenkinskp"
  vpc_security_group_ids = [aws_security_group.jenkinstaskkkk.id]
  user_data       = "${file("install_jenkins.sh")}"
  depends_on = [
    aws_iam_role.jenkins_role
    ]
  tags = {
    Name = "Jenkins"
  }
}