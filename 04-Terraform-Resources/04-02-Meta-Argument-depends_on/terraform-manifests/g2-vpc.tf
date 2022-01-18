# Resources Block
# Resource-1: Create vpc Here is resource name is aws_vpc and Local resouce name is dev_vpc
resource    "aws-vpc" "dev_vpc" {
   cidr_block = "10.0.0.0/16"

   tags = {
     "name" = "vpc_dev"
   }
}
 # Resource-2: Create Subnets


# Resource-3: Internet Gateway

# Resource-4: Create Route Table


# Resource-5: Create Route in Route Table for Internet Access


# Resource-6: Associate the Route Table with the Subnet

# Resource-7: Create Security Group
