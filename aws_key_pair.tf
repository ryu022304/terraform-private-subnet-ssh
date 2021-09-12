resource "aws_key_pair" "key" {
  key_name   = "${var.app_name}-key"
  public_key = var.key_value
}
