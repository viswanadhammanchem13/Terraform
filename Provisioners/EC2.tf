
resource "aws_instance" "roboshop" {
  ami = var.ami_id # clLeft and right side name no need to be same
  vpc_security_group_ids = [ aws_security_group.Allow_All.id ]
  instance_type = var.instance_type

  tags = var.EC2_tags

  provisioner "local-exec" {
    command = " echo ${self.private_ip} > inventory"
    on_failure = continue # ignoring errors
  }

  provisioner "local-exec" {
    command = "echo this instane is destoried"
    when = destroy
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx  ",
    ]
    on_failure = continue
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
    ]
    on_failure = continue
  }
}



resource "aws_security_group" "Allow_All" {
  name        = var.sg_name
  description = var.sg_description

    ingress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = var.protocol # Allows all traffic
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }
    egress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = var.protocol #ALL traffic
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

    tags = var.SG_tags
} 