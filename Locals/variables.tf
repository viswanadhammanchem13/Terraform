variable "project"{
    default= "roboshop"
}

variable "Environment"{
    default= "dev"
}

variable "Compnent"{
    default= "payment"
}

# variable "Final-Name"{
    # default= "${ var.project }-${ var.Environment }-${ var.Compnent }"
# }

variable "common_tags"{
    default = {
        Project = "Roboshop"
        Terraform = "yes"
    }
}


# EC2 Name= Cart 
# EC2 Name= roboshop-dev-cart