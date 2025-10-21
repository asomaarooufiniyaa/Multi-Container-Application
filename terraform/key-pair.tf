resource "aws_key_pair" "main_key" {
  key_name   = "main_keeeyyyyy"
  public_key = file("${path.module}/keys/id_ed25519.pub")

  lifecycle {
    prevent_destroy = true
  }
}