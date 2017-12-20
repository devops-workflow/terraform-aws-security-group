output "id" {
  description = "The ID of the security group"
  value       = "${module.complete_sg.id}"
}

output "vpc_id" {
  description = "The VPC ID"
  value       = "${module.complete_sg.vpc_id}"
}

output "owner_id" {
  description = "The owner ID"
  value       = "${module.complete_sg.owner_id}"
}

output "name" {
  description = "The name of the security group"
  value       = "${module.complete_sg.name}"
}

output "description" {
  description = "The description of the security group"
  value       = "${module.complete_sg.description}"
}
