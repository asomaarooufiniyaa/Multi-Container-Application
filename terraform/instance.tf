resource "aws_instance" "web_server" {
  count = 3
  ami           = data.aws_ami.server_ami.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.main_key.key_name
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  tags = {
    Name = "web_server"
  }
}