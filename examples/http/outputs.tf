
# http, http_mysql_1, http_mysql_2, http_with_egress_minimal, http_with_egress_sg
output "http_id" {
  value       = "${module.http_sg.id}"
}
output "http_vpc_id" {
  value       = "${module.http_sg.vpc_id}"
}
output "http_owner_id" {
  value       = "${module.http_sg.owner_id}"
}
output "http_name" {
  value       = "${module.http_sg.name}"
}
output "http_description" {
  value       = "${module.http_sg.description}"
}
output "http_ingress" {
  value       = "${module.http_sg.ingress}"
}
output "http_egress" {
  value       = "${module.http_sg.egress}"
}
output "http_egress_rules_ids" {
  value       = "${module.http_sg.egress_rules_ids}"
}
output "http_ingress_rules_ids" {
  value       = "${module.http_sg.ingress_rules_ids}"
}


output "http_mysql_1_id" {
  value       = "${module.http_mysql_1_sg.id}"
}
output "http_mysql_1_vpc_id" {
  value       = "${module.http_mysql_1_sg.vpc_id}"
}
output "http_mysql_1_owner_id" {
  value       = "${module.http_mysql_1_sg.owner_id}"
}
output "http_mysql_1_name" {
  value       = "${module.http_mysql_1_sg.name}"
}
output "http_mysql_1_description" {
  value       = "${module.http_mysql_1_sg.description}"
}
output "http_mysql_1_ingress" {
  value       = "${module.http_mysql_1_sg.ingress}"
}
output "http_mysql_1_egress" {
  value       = "${module.http_mysql_1_sg.egress}"
}


output "http_mysql_2_id" {
  value       = "${module.http_mysql_2_sg.id}"
}
output "http_mysql_2_vpc_id" {
  value       = "${module.http_mysql_2_sg.vpc_id}"
}
output "http_mysql_2_owner_id" {
  value       = "${module.http_mysql_2_sg.owner_id}"
}
output "http_mysql_2_name" {
  value       = "${module.http_mysql_2_sg.name}"
}
output "http_mysql_2_description" {
  value       = "${module.http_mysql_2_sg.description}"
}
output "http_mysql_2_ingress" {
  value       = "${module.http_mysql_2_sg.ingress}"
}
output "http_mysql_2_egress" {
  value       = "${module.http_mysql_2_sg.egress}"
}


output "http_with_egress_minimal_id" {
  value       = "${module.http_with_egress_minimal_sg.id}"
}
output "http_with_egress_minimal_vpc_id" {
  value       = "${module.http_with_egress_minimal_sg.vpc_id}"
}
output "http_with_egress_minimal_owner_id" {
  value       = "${module.http_with_egress_minimal_sg.owner_id}"
}
output "http_with_egress_minimal_name" {
  value       = "${module.http_with_egress_minimal_sg.name}"
}
output "http_with_egress_minimal_description" {
  value       = "${module.http_with_egress_minimal_sg.description}"
}
output "http_with_egress_minimal_ingress" {
  value       = "${module.http_with_egress_minimal_sg.ingress}"
}
output "http_with_egress_minimal_egress" {
  value       = "${module.http_with_egress_minimal_sg.egress}"
}


output "http_with_egress_id" {
  value       = "${module.http_with_egress_sg.id}"
}
output "http_with_egress_vpc_id" {
  value       = "${module.http_with_egress_sg.vpc_id}"
}
output "http_with_egress_owner_id" {
  value       = "${module.http_with_egress_sg.owner_id}"
}
output "http_with_egress_name" {
  value       = "${module.http_with_egress_sg.name}"
}
output "http_with_egress_description" {
  value       = "${module.http_with_egress_sg.description}"
}
output "http_with_egress_ingress" {
  value       = "${module.http_with_egress_sg.ingress}"
}
output "http_with_egress_egress" {
  value       = "${module.http_with_egress_sg.egress}"
}
