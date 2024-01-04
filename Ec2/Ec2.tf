resource "aws_instance" "web" {
  ami           ="ami-03265a0778a880afb"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.roboshop.id]

  tags = {
    Name = "terraformserver"
  }
}

resource "aws_security_group" "roboshop" {
  name        = var.sg-name
  description = var.sg-description

  ingress {
    description      = "allow ports"
    from_port        = var.inbound-from-port
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshopall"
  }
}