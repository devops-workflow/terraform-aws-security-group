
output "complete_id" {
  value       = "${module.complete_sg.id}"
}
output "complete_vpc_id" {
  value       = "${module.complete_sg.vpc_id}"
}
output "complete_owner_id" {
  value       = "${module.complete_sg.owner_id}"
}
output "complete_name" {
  value       = "${module.complete_sg.name}"
}
output "complete_description" {
  value       = "${module.complete_sg.description}"
}
output "complete_ingress" {
  value       = "${module.complete_sg.ingress}"
}
output "complete_egress" {
  value       = "${module.complete_sg.egress}"
}
output "complete_egress_rules_ids" {
  value       = "${module.complete_sg.egress_rules_ids}"
}
output "complete_ingress_rules_ids" {
  value       = "${module.complete_sg.ingress_rules_ids}"
}

# ipv4_ipv6_example
output "ipv4_ipv6_id" {
  value       = "${module.ipv4_ipv6_example.id}"
}
output "ipv4_ipv6_vpc_id" {
  value       = "${module.ipv4_ipv6_example.vpc_id}"
}
output "ipv4_ipv6_owner_id" {
  value       = "${module.ipv4_ipv6_example.owner_id}"
}
output "ipv4_ipv6_name" {
  value       = "${module.ipv4_ipv6_example.name}"
}
output "ipv4_ipv6_description" {
  value       = "${module.ipv4_ipv6_example.description}"
}
output "ipv4_ipv6_ingress" {
  value       = "${module.ipv4_ipv6_example.ingress}"
}
output "ipv4_ipv6_egress" {
  value       = "${module.ipv4_ipv6_example.egress}"
}
output "ipv4_ipv6_egress_rules_ids" {
  value       = "${module.ipv4_ipv6_example.egress_rules_ids}"
}
output "ipv4_ipv6_ingress_rules_ids" {
  value       = "${module.ipv4_ipv6_example.ingress_rules_ids}"
}
