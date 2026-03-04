resource "aws_route53_record" "roboshop" {
    for_each = aws_instance.roboshop
     # count = 4
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain_name}"
    # name  = "${var.instance[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [each.value.private_ip]
    # records = [aws_instance.roboshop[count.index].private_ip]
    allow_overwrite = true
}