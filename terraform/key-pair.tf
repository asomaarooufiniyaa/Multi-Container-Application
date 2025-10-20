resource "aws_key_pair" "main_key" {
  key_name   = "main_key"
  public_key = file("/home/officer/.ssh/id_ed25519.pub")
}