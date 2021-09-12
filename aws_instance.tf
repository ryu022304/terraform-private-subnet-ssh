# EC2インスタンス
resource "aws_instance" "ec2" {
  ami                  = var.instance_id
  instance_type        = "t3.nano"
  subnet_id            = aws_subnet.private-subnet.id
  user_data            = file("./files/user_data.sh")
  key_name             = aws_key_pair.key.key_name
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  vpc_security_group_ids      = [
    aws_security_group.private-ec2.id
  ]

  tags = {
    Name = "${var.app_name}-instance"
  }
}
