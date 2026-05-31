resource "aws_instance" "vm_dev1" {
  ami = "ami-00e801948462f718a"
  instance_type = "t3.micro"
  tags = {
    Name = "vm-dev1"
  } 
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.vm_dev1.availability_zone
  size              = 8
}