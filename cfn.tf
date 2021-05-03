resource "aws_cloudformation_stack" "sftp_vpc" {
  name          = "sftp-vpc"
  template_body = file("files/sftp-workshop-endpoint.yaml")
  capabilities  = ["CAPABILITY_NAMED_IAM"]
}