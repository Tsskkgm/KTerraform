resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_name == "MONGODB" ? "t3.small" : "t2.micro"
  
}