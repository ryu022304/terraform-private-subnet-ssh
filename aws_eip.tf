resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name = "${var.app_name}-eip"
  }
}
