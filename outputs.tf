output "id" {
  description = "The ID of the security group"
  value       = "${element(concat(aws_security_group.this.*.id, list("")), 0)}"
}

output "vpc_id" {
  description = "The VPC ID"
  value       = "${element(concat(aws_security_group.this.*.vpc_id, list("")), 0)}"
}

output "owner_id" {
  description = "The owner ID"
  value       = "${element(concat(aws_security_group.this.*.owner_id, list("")), 0)}"
}

output "name" {
  description = "The name of the security group"
  value       = "${element(concat(aws_security_group.this.*.name, list("")), 0)}"
}

output "description" {
  description = "The description of the security group"
  value       = "${element(concat(aws_security_group.this.*.description, list("")), 0)}"
}

# Gets empty list of list when security group is created.
# Gets list of list of maps if security group already exists
output "ingress" {
  description = "The ingress rules"
  value       = "${aws_security_group.this.*.ingress}"
}
output "egress" {
  description = "The egress rules"
    value     = "${aws_security_group.this.*.egress}"
}
# Can get info from the rules:
# id, type, from_port, to_port, protocol, description
# Aggregate all ingress rules into 1 var. Same for egress rules
# Maybe use null_resource to build outputs?
output "egress_rules_ids" {
  description = "Egress rule IDs"
  value       = "${concat(
    aws_security_group_rule.egress_rules.*.id,
    aws_security_group_rule.egress_with_source_security_group_id.*.id,
    aws_security_group_rule.egress_with_cidr_blocks.*.id,
    aws_security_group_rule.egress_with_ipv6_cidr_blocks.*.id,
    aws_security_group_rule.egress_with_self.*.id
  )}"
}
output "ingress_rules_ids" {
  description = "Ingress rule IDs"
  value       = "${concat(
    aws_security_group_rule.ingress_rules.*.id,
    aws_security_group_rule.ingress_with_source_security_group_id.*.id,
    aws_security_group_rule.ingress_with_cidr_blocks.*.id,
    aws_security_group_rule.ingress_with_ipv6_cidr_blocks.*.id,
    aws_security_group_rule.ingress_with_self.*.id
  )}"
}
