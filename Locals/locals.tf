locals{
    Final_Name= "${ var.project }-${ var.Environment }-${ var.Compnent }"
    ec2_tags = merge(
        var.common_tags,
        {
            environmet = "dev",
            version = "1.0"
        }
    )
}