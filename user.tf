resource "aws_iam_role" "user1" {
  name = "tf-test-transfer-user-iam-role"

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

resource "aws_iam_role_policy" "user1" {
  name = "tf-test-transfer-user-iam-policy"
  role = aws_iam_role.user1.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowFullAccesstoS3",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_transfer_user" "user1" {
  server_id = aws_transfer_server.example.id
  user_name = "tftestuser"
  role      = aws_iam_role.user1.arn
  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry = "/"
    target = "/awstransferworkshopbucket1-c56b9610-abfd-11eb-8f6e-02d2dcfa6bf9"
  }
}