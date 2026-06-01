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

resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.vm_dev1.id
}

resource "aws_ebs_volume" "ebs_volume1" {
  availability_zone = aws_instance.vm_dev1.availability_zone
  size              = 8
}