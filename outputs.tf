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

output "ingress" {
  description = "The ingress rules"
  value       = "${aws_security_group.this.*.ingress}"
}

output "egress" {
  description = "The egress rules"
    value       = "${aws_security_group.this.*.egress}"
}
