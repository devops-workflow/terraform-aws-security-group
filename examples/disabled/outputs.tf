
output "complete_id" {
  value       = "${module.complete_sg_disabled.id}"
}
output "complete_vpc_id" {
  value       = "${module.complete_sg_disabled.vpc_id}"
}
output "complete_owner_id" {
  value       = "${module.complete_sg_disabled.owner_id}"
}
output "complete_name" {
  value       = "${module.complete_sg_disabled.name}"
}
output "complete_description" {
  value       = "${module.complete_sg_disabled.description}"
}
output "complete_ingress" {
  value       = "${module.complete_sg_disabled.ingress}"
}
output "complete_egress" {
  value       = "${module.complete_sg_disabled.egress}"
}


output "http_id" {
  value       = "${module.http_sg_disabled.id}"
}
output "http_vpc_id" {
  value       = "${module.http_sg_disabled.vpc_id}"
}
output "http_owner_id" {
  value       = "${module.http_sg_disabled.owner_id}"
}
output "http_name" {
  value       = "${module.http_sg_disabled.name}"
}
output "http_description" {
  value       = "${module.http_sg_disabled.description}"
}
output "http_ingress" {
  value       = "${module.http_sg_disabled.ingress}"
}
output "http_egress" {
  value       = "${module.http_sg_disabled.egress}"
}
