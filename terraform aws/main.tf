resource "aws_instance" "webservervm" {
  ami             = "ami-0e001c9271cf7f3b9"
  instance_type   = "t2.micro"
  key_name        = "ubuntu-key"
  security_groups = ["${aws_security_group.webserverSG.name}"]
  tags = {
    Name = "webservervm"
  }

}
