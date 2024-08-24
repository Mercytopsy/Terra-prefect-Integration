provider "aws"{
    region = "eu-north-1" 
}
# variable "cidr_blocks" {
#     description= "cidr blocks for vpc and subnet"
#     #default= "" #This will execute automatically if a value isn't set
#     type = list(string)
# }

# variable "cidr_blocks_object" {
#     description= "cidr blocks for vpc and subnet"
#     type = list(object({
            # cidr_block = string
            # name = string
            # }))
# }

variable "subnet_cidr_block" {
    description= "subnet cidr block"
    #default= "" #This will execute automatically if a value isn't set
    type = string
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
}

variable "environment" {
    description = "deployment environment"
}

resource "aws_vpc" "development-vpc"{
    cidr_block = var.vpc_cidr_block
    # cidr_block = var.cidr_blocks[1]
    # cidr_block = var.cidr_blocks_object[1].cidr_block

    tags = {
        Name: "development"
    }
}

resource "aws_subnet" "dev-subnet-1"{
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    # cidr_block = var.cidr_blocks[0]
    # cidr_block = var.cidr_blocks_object[0].cidr_block
    
    availability_zone = "eu-north-1a"
    tags = {
        Name: "subnet-dev"
    }
}

# data "aws_vpc" "existing_vpc" {
#     default = true
# }

output "dev-vpc-id"{
    value = aws_vpc.development-vpc.id
}

output "dev-subnet-id"{
    value = aws_subnet.dev-subnet-1.id
}