# Resources Block
# Resource-1: Create vpc Here is resource name is aws_vpc and Local resouce name is dev_vpc
resource    "aws-vpc" "dev_vpc" {
   cidr_block = "10.0.0.0/16"

   tags = {
     "name" = "vpc_dev"
   }
}
 # Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
   vpc_id = aws_vpc.vpc-dev.id
   cidr_block ="10.0.1.0/24"
   avaavailability_zone = "us-east-1a"
   map_publimap_public_ip_on_launch = true 
  }
  
# Resource-3: Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
   vpc_vpc_id = aws_vpc.vpc_dev.id
     
}
# Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
   vpc_vpc_id = aws_vpc.vpc_dev.id
    
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route" {
   route_table_id = aws_route_table.vpc-dev-public-route-table.id 
   destination_cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.vpc-dev-igw.id
}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
   rouroute_table_id = aws_route_table.vpc-dev-public-subnet-1.id
   subnet_subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
     
}

# Resource-7: Create Security Group
resource "aws_security_group" "dec-vpc-sg" {
   name = "dev-vpc-default-sg"
   vpc_vpc_id = aws_vpc.vpc-dev.id
   description = "Dev VPC Default Security Group"

   ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}  
  
}