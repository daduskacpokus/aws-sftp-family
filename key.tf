resource "aws_transfer_ssh_key" "example" {
  server_id = aws_transfer_server.example.id
  user_name = aws_transfer_user.user1.user_name
  body      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwcG4X3i1H57HAQVSw8j6izuZz0Wf3FhnvuIBYxL0CQloy7o2Gfzco2/sIkvKeLXnz/G9ql+YpcwAkfox7V6Ve+N9wwHQQw1HqVdJ+6cqGcc2sDY7euznJtpGXFOA1MI3LyV8THPzjJwyWDtL4jwnwUaJQKGoczoDmbrfxu2A/yTj8JVX+/OjlnAumOxsnxpmJXcwNAVQZM/0XRwl95p30EXh7kJY2yDwKQNZbDzx2LtjMLn6EQx0zBH96MtGsC+K9YDVZZcSY6TQjAKgTK+aIMrPRSH8C+DlLuXg1J5nxyilIxbZ2uZNG+ZylWhvy8pM9XYhB98lPUT3cKaxRESriWnjEKCtEVxsxvtyvCPb1+HT9a2/BBP33TrxNYmPSwlD0poqukjOIJbFSo1y2tiJIn1+urfc3Ky1lLhjwhl0e8BsImdFhPsQAGOOLC5LVwaKsc9oR1nLmHLgTXEppCu+iCFj33yP2Ih4x5P8Mjgp6clBCh8H39WHo5TDs16nxdok= user@DESKTOP-I2O8J8R"
}