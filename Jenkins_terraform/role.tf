resource "aws_iam_instance_profile" "jenkins_role" {
  name = "jenkins_role"
  role = aws_iam_role.jenkins_role.name
}
resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = file("assume_role_policy.json")

  tags = {
    tag-key = "tag-value"
  }

  inline_policy {
    name = "ec2_access"

    policy = file("ec2_access.json")
}
  inline_policy {
    name = "s3_access"

    policy = file("s3_access.json")
  }
inline_policy {
    name = "ecr_access"

    policy = file("ecr_access.json")
}
}