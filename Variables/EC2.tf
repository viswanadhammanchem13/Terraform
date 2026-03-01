
resource "aws_instance" "roboshop" {
ami = "ami-0220d79f3f480ecf5"
vpc_security_group_ids = [ aws_security_group.Allow_All.id ]
instance_type = "t3.micro"

tags = {
Name = "Hello Wolrd"
}
}
resource "aws_security_group" "Allow_All" {
  name        = "Allow_All"
  description = "Allow inbound traffic and all outbound traffic"
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #Allows all traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #ALL traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name = "Allow_All"
  }
} 