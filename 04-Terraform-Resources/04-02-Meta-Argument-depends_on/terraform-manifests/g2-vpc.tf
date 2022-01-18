# Resources Block
# Resource-1: Create vpc Here is resource name is aws_vpc and Local resouce name is dev_vpc
resource    "aws-vpc" "dev_vpc" {
   cidr_block = "10.0.0.0/16"

   tags = {
     "name" = "vpc_dev"
   }
}
 # Resource-2: Create Subnets
resource "aws_subnet" "vpc_dev_public_subnet-1" {
   vpc_id = aws_vpc.vpc-dev.id
   cidr_block ="10.0.1.0/24"
   avaavailability_zone = "us-east-1a"
   map_publimap_public_ip_on_launch = true+ 
  
}

# Resource-3: Internet Gateway

# Resource-4: Create Route Table


# Resource-5: Create Route in Route Table for Internet Access


# Resource-6: Associate the Route Table with the Subnet

# Resource-7: Create Security Group
