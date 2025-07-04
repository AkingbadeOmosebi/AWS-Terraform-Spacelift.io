resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-simple-vpc"
  }
}


# Subnet -1 
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-1"
  }
}

# Subnet -2
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-2"
  }
}


# Subnet -3
resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "subnet-3"
  }
}


#Ec2-Instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "T3m-Server" {
  ami           = "ami-003c9adf81de74b40"
  subnet_id     = "subnet2"
  instance_type = "t3.micro"

  tags = {
    Name = var.T3m-name
  }
}

resource "aws_instance" "T2n-server" {
  ami           = "ami-003c9adf81de74b40"
  subnet_id     = "subnet3"
  instance_type = "t2.nano"

  tags = {
    Name = var.T2n-name
  }
}