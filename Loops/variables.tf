variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "AMI ID of Join DevOps RHEL9"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "EC2_tags" {
    type=map(string)
    default = {
        Name= "Roboshop"
        Purpose= "Variable Demo"
    }
}

variable "sg_name" {
    default = "Practice"
}

variable "sg_description" {
    default = "Allow inbound traffic and all outbound traffic"
}

variable "from_port" {
    default= 0
    type= number
}

variable "To_port" {
    type = number
    default = 0
}

variable "protocol" {
    default = -1
}

variable "cidr_blocks" {
    type = list(string)
    default= ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
    type = list(string)
    default = ["::/0"]
}

variable "SG_tags" {
    default= {
        Name = "Practice" 

    }
}

variable "Environment"{
    default= "Prod"
}

variable "instance"{
    default = [ "mongodb","mysql","reddis","rabbitmq" ]
}

variable "zone_id"{
    default = "Z03584735O3LYRT2Q9HU"
}

variable "domain_name"{
    default = "manchem.site"
}