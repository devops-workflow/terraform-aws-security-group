output "id" {
  description = "The ID of the security group"
  value       = "${module.sg.id}"
}

output "vpc_id" {
  description = "The VPC ID"
  value       = "${module.sg.vpc_id}"
}

output "owner_id" {
  description = "The owner ID"
  value       = "${module.sg.owner_id}"
}

output "name" {
  description = "The name of the security group"
  value       = "${module.sg.name}"
}

output "description" {
  description = "The description of the security group"
  value       = "${module.sg.description}"
}
