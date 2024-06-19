# Cross Reference Resource Attributes in Terraform

This repository demonstrates how to cross-reference resource attributes in Terraform. Cross-referencing attributes between resources is a common practice in Terraform to create dependencies and use values from one resource to configure another. This example includes a basic setup using AWS resources, but the principles can be applied to other providers as well.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Resources](#resources)
- [Branching Strategy](#branching-strategy)
- [Screenshots](#screenshots)




## Introduction

In Terraform, it's often necessary to reference the attributes of one resource in another resource. This is useful for ensuring that resources are created in a specific order and for passing data between resources. This example will show how to:

- Create an AWS VPC.
- Create a subnet within that VPC.
- Launch an EC2 instance in the subnet and associate a security group with it.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS CLI installed and configured with appropriate permissions.
- An AWS account.

## Usage

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/terraform-cross-reference-example.git
    cd terraform-cross-reference-example
    ```

2. **Initialize the Terraform configuration:**

    ```sh
    terraform init
    ```

3. **Plan the infrastructure changes:**

    ```sh
    terraform plan
    ```

4. **Apply the infrastructure changes:**

    ```sh
    terraform apply
    ```

5. **Destroy the infrastructure (when no longer needed):**

    ```sh
    terraform destroy
    ```

## Resources

The example configuration includes the following resources:

1. **VPC:**
    - Creates a new VPC.
    - Outputs the VPC ID for use in other resources.

2. **Subnet:**
    - Creates a subnet within the VPC.
    - References the VPC ID from the VPC resource.

3. **Security Group:**
    - Creates a security group within the VPC.
    - Outputs the Security Group ID for use in the EC2 instance.

4. **EC2 Instance:**
    - Launches an EC2 instance in the subnet.
    - References the Subnet ID and Security Group ID.

## Example Code

Here is a simplified example of the Terraform code used in this repository:

```hcl
# VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Subnet
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
}

# Security Group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  security_groups = [aws_security_group.example.name]
}
```
## branching-strategy:
This repository contains different branches for various Terraform topics. Each branch focuses on a specific topic or feature. 
1. `main` branch: Contains the primary example of cross-referencing resource attributes in Terraform.
2. `outpu_value` branch: Demonstrates how to use output values in Terraform


## Screenshots:

![alt text](<Screenshot from 2024-06-18 15-09-27.png>)
![alt text](<Screenshot from 2024-06-18 15-10-43.png>)
![alt text](<Screenshot from 2024-06-18 15-10-55.png>)