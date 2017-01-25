provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "servidor" {
  ami = "ami-9398d3e0"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.servidorsg.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Na na nan na nan nan nan BATMAN!!!" > index.html
              nohup python -m SimpleHTTPServer 8080 &
              EOF
}

resource "aws_security_group" "servidorsg" {
  name = "terraform-security-group"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.servidor.public_ip}"
}
