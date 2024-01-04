resource "aws_instance" "web" {
  count = 6
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {

    Name = var.instance_names[count.index]

  }  
  
}