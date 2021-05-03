resource "aws_transfer_ssh_key" "example" {
  server_id = aws_transfer_server.example.id
  user_name = aws_transfer_user.user1.user_name
  body      = var.ssh_public_key
}
