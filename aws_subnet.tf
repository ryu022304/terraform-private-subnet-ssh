
resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "${var.cidr_prefix}.0.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app_name}-private-subnet"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "${var.cidr_prefix}.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.app_name}-public-subnet"
  }
}
