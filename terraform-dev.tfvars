subnet_cidr_block =  "10.0.10.0/24"
vpc_cidr_block = "10.0.0.0/16"

environment = "development"
cidr_blocks = ["10.0.10.0/24", "10.0.0.0/16"]

cidr_blocks_object = [{cidr_block= "10.0.10.0/24", name ="dev-subnet"}, {cidr_block = "10.0.0.0/16", name = "dev-vpc"}]