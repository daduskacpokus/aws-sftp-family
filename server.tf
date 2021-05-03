resource "aws_transfer_server" "example" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.example.arn

  tags = {
    NAME = "tf-acc-test-transfer-server"
    ENV  = "test"
  }
  endpoint_type = "VPC"
  endpoint_details {
    vpc_id = "vpc-06a97bf1ced4db781"
    subnet_ids = ["subnet-01963496a50b4ac78"]
    address_allocation_ids = ["eipalloc-0d6a2f4948a11cfba"]
  }
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