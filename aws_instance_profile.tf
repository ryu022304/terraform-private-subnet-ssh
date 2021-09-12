data "aws_iam_policy_document" "assume_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "instance_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
  name               = "${var.app_name}-instance-role"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.app_name}-instance-profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role_policy_attachment" "instance_role_policy_attachment" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
