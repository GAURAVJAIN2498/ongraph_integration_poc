provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ansible_sg" {
  name        = "ansible-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_PUBLIC_IP/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible_master" {
  ami           = "ami-00ca32bbc84273381" 
  instance_type = "t2.micro"
  key_name      = /root/poc.key
  security_groups = [aws_security_group.ansible_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y ansible python3 python3-pip unzip
    pip3 install boto boto3
  EOF
  tags = {
    Name = "Ansible-master"
  }
}

resource "aws_instance" "ansible_worker1" {
  ami           = "ami-0bbdd8c17ed981ef9"
  instance_type = "t2.micro"
  key_name      = /root/poc.key
  security_groups = [aws_security_group.ansible_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y python3 python3-pip
    pip3 install boto boto3
  EOF
  tags = {
    Name = "Ansible-Worker1"
   }
  }

resource "aws_instance" "ansible_worker2" {
  ami           = "ami-0bbdd8c17ed981ef9" 
  instance_type = "t2.micro"
  key_name      = /root/poc.key
  security_groups = [aws_security_group.ansible_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y python3 python3-pip
    pip3 install boto boto3
  EOF
  tags = {
    Name = "Ansible-Worker2"
    }
  }


