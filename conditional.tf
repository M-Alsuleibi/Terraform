resource "aws_instance" "dev"{
ami = "ami-04b70fa74e45c3917"
instance_type = var.ec2type[0]
count = var.is_test == true ? 3:0
}

resource "aws_instance" "prod"{
ami = "ami-04b70fa74e45c3917"
instance_type = var.ec2type[1]
count = var.is_test == false ? 1:0

}

