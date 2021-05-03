resource "aws_transfer_server" "example" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.example.arn

  tags = {
    NAME = "tf-acc-test-transfer-server"
    ENV  = "test"
  }
  endpoint_type = "VPC"
  endpoint_details {
    vpc_id                 = aws_cloudformation_stack.sftp_vpc.outputs.vpcID
    subnet_ids             = [aws_cloudformation_stack.sftp_vpc.outputs.subnet1ID, aws_cloudformation_stack.sftp_vpc.outputs.subnet2ID]
    address_allocation_ids = [aws_cloudformation_stack.sftp_vpc.outputs.elasticIP1, aws_cloudformation_stack.sftp_vpc.outputs.elasticIP2]
  }
  depends_on = [aws_cloudformation_stack.sftp_vpc]
}

resource "aws_iam_role" "example" {
  name = "tf-test-transfer-server-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "example" {
  name = "tf-test-transfer-server-iam-policy"
  role = aws_iam_role.example.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "AllowFullAccesstoCloudWatchLogs",
        "Effect": "Allow",
        "Action": [
            "logs:*"
        ],
        "Resource": "*"
        }
    ]
}
POLICY
}