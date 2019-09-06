resource "aws_route53_record" "10kft-scheduling" {
  zone_id = "${data.aws_route53_zone.infrastructure_root_domain_zone.zone_id}"
  name    = "10kft-scheduling-dashboard.${var.environment}.${var.infrastructure_name}.${var.root_domain_zone}."
  type    = "CNAME"
  ttl     = "3600"

  records = [
    "${module.app-service.lb_dns_name}",
  ]
}
