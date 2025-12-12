# VPC
resource "aws_vpc" "tera_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tera_vpc"
  }
}

# Subnets
resource "aws_subnet" "tera_Subnet1" {
  vpc_id                  = aws_vpc.tera_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-2"
  map_public_ip_on_launch = true
  tags = {
    Name = "tera_Subnet1"
  }
}

#internet_gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tera_vpc.id

  tags = {
    Name = "tera_igw"
  }
}
#route_table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.tera_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tera_route_table"
  }
}

#route_table_asssociation
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.tera_Subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
#security_group
resource "aws_security_group" "tera_sg" {
  name        = "tera_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.tera_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tera_sg"
  }
}
resource "aws_instance" "tera_ins" {
    ami = "ami-007e5a061b93ceb2f"  #should be the regions ami
    instance_type = "t3.micro"
    #count = 2      # to create multiple instance
    subnet_id              = aws_subnet.tera_Subnet1.id
    vpc_security_group_ids = [aws_security_group.tera_sg.id]


    associate_public_ip_address = true   # to create in a own vpc or subnet
    tags = {
      Name ="tera_ins"
    }
}


