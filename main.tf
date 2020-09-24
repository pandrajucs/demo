//Provide AWS Access key and Secret key to execute terraform

provider "aws" {
   
    region = "us-east-1"
    
}

//Craete Security group

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-03fce764d6d3fdd1f"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}

//Create TG

resource "aws_lb_target_group" "tg" {
  name     = "NLB-TG"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-03fce764d6d3fdd1f"
 
}


resource "aws_instance" "server-1" {
    ami = "ami-00514a528eadbc95b"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "AWS_KeyPair"
    subnet_id = "subnet-034250c45e4a08fbf"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    user_data = "${file("script1.sh")}"
    tags = {
        Name = "Home-Server-1"
    }
}










