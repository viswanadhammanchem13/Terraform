
resource "aws_instance" "roboshop" {
  ami = var.ami_id # clLeft and right side name no need to be same
  vpc_security_group_ids = [ aws_security_group.Allow_All.id ]
  instance_type = var.instance_type

  tags = var.EC2_tags
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