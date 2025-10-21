resource "aws_key_pair" "main_key" {
<<<<<<< HEAD
  key_name   = "main_keyyy"
=======
  key_name   = "main_keyy"
>>>>>>> d918f442fd9e0dbada207bcbc610bf4c2e70bdf5
  public_key = file("${path.module}/keys/id_ed25519.pub")

  lifecycle {
    prevent_destroy = true
  }
}