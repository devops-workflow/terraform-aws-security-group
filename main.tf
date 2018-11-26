#
# Setup AWS Security Group and rules
#
# https://www.terraform.io/docs/providers/aws/r/security_group.html
# https://www.terraform.io/docs/providers/aws/r/security_group_rule.html

module "enabled" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.2"
  value   = "${var.enabled}"
}

module "label" {
  source        = "devops-workflow/label/local"
  version       = "0.2.1"
  attributes    = "${var.attributes}"
  component     = "${var.component}"
  delimiter     = "${var.delimiter}"
  environment   = "${var.environment}"
  monitor       = "${var.monitor}"
  name          = "${var.name}"
  namespace-env = "${var.namespace-env}"
  namespace-org = "${var.namespace-org}"
  organization  = "${var.organization}"
  owner         = "${var.owner}"
  product       = "${var.product}"
  service       = "${var.service}"
  tags          = "${var.tags}"
  team          = "${var.team}"
}

#################
# Security group
#################
resource "aws_security_group" "this" {
  count       = "${module.enabled.value}"
  name        = "${module.label.id}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"
  tags        = "${module.label.tags}"

  lifecycle {
    create_before_destroy = true
  }
}

###################################
# Ingress - List of rules (simple)
###################################
# Security group rules with "cidr_blocks" and it uses list of rules names
resource "aws_security_group_rule" "ingress_rules" {
  count = "${module.enabled.value ? length(var.ingress_rules) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.ingress_cidr_blocks}"]
  ipv6_cidr_blocks = ["${var.ingress_ipv6_cidr_blocks}"]
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]

  from_port   = "${element(var.rules[var.ingress_rules[count.index]], 0)}"
  to_port     = "${element(var.rules[var.ingress_rules[count.index]], 1)}"
  protocol    = "${element(var.rules[var.ingress_rules[count.index]], 2)}"
  description = "${length(var.rules[var.ingress_rules[count.index]]) > 3 ?
    element(var.rules[var.ingress_rules[count.index]], 3) : ""}"
}

##########################
# Ingress - Maps of rules
##########################
# Security group rules with "source_security_group_id", but without "cidr_blocks" and "self"
resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
  count = "${module.enabled.value ? length(var.ingress_with_source_security_group_id) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  source_security_group_id = "${lookup(var.ingress_with_source_security_group_id[count.index], "source_security_group_id")}"
  ipv6_cidr_blocks         = ["${var.ingress_ipv6_cidr_blocks}"]
  prefix_list_ids          = ["${var.ingress_prefix_list_ids}"]

  from_port = "${lookup(var.ingress_with_source_security_group_id[count.index], "from_port", element(var.rules[lookup(var.ingress_with_source_security_group_id[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.ingress_with_source_security_group_id[count.index], "to_port", element(var.rules[lookup(var.ingress_with_source_security_group_id[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.ingress_with_source_security_group_id[count.index], "protocol", element(var.rules[lookup(var.ingress_with_source_security_group_id[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.ingress_with_source_security_group_id[count.index], "description",
    element(var.rules[lookup(var.ingress_with_source_security_group_id[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "cidr_blocks", but without "ipv6_cidr_blocks", "source_security_group_id" and "self"
resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = "${module.enabled.value ? length(var.ingress_with_cidr_blocks) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  cidr_blocks     = ["${split(",", lookup(var.ingress_with_cidr_blocks[count.index], "cidr_blocks", join(",", var.ingress_cidr_blocks)))}"]
  prefix_list_ids = ["${var.ingress_prefix_list_ids}"]

  from_port = "${lookup(var.ingress_with_cidr_blocks[count.index], "from_port", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.ingress_with_cidr_blocks[count.index], "to_port", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.ingress_with_cidr_blocks[count.index], "protocol", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.ingress_with_cidr_blocks[count.index], "description",
    element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "ipv6_cidr_blocks", but without "cidr_blocks", "source_security_group_id" and "self"
resource "aws_security_group_rule" "ingress_with_ipv6_cidr_blocks" {
  count = "${module.enabled.value ? length(var.ingress_with_ipv6_cidr_blocks) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  ipv6_cidr_blocks = ["${split(",", lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "ipv6_cidr_blocks", join(",", var.ingress_ipv6_cidr_blocks)))}"]
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]

  from_port = "${lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "from_port", element(var.rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "to_port", element(var.rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "protocol", element(var.rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "description",
    element(var.rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "self", but without "cidr_blocks" and "source_security_group_id"
resource "aws_security_group_rule" "ingress_with_self" {
  count = "${module.enabled.value ? length(var.ingress_with_self) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  self             = "${lookup(var.ingress_with_self[count.index], "self", true)}"
  ipv6_cidr_blocks = ["${var.ingress_ipv6_cidr_blocks}"]
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]

  from_port = "${lookup(var.ingress_with_self[count.index], "from_port", element(var.rules[lookup(var.ingress_with_self[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.ingress_with_self[count.index], "to_port", element(var.rules[lookup(var.ingress_with_self[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.ingress_with_self[count.index], "protocol", element(var.rules[lookup(var.ingress_with_self[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.ingress_with_self[count.index], "description",
    element(var.rules[lookup(var.ingress_with_self[count.index], "rule", "_")], 3)
  )}"
}

#################
# End of ingress
#################

##################################
# Egress - List of rules (simple)
##################################
# Security group rules with "cidr_blocks" and it uses list of rules names
resource "aws_security_group_rule" "egress_rules" {
  count = "${module.enabled.value ? length(var.egress_rules) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  cidr_blocks      = ["${var.egress_cidr_blocks}"]
  ipv6_cidr_blocks = ["${var.egress_ipv6_cidr_blocks}"]
  prefix_list_ids  = ["${var.egress_prefix_list_ids}"]

  from_port   = "${element(var.rules[var.egress_rules[count.index]], 0)}"
  to_port     = "${element(var.rules[var.egress_rules[count.index]], 1)}"
  protocol    = "${element(var.rules[var.egress_rules[count.index]], 2)}"
  description = "${length(var.rules[var.egress_rules[count.index]]) > 3 ?
    element(var.rules[var.egress_rules[count.index]], 3) : ""}"
}

#########################
# Egress - Maps of rules
#########################
# Security group rules with "source_security_group_id", but without "cidr_blocks" and "self"
resource "aws_security_group_rule" "egress_with_source_security_group_id" {
  count = "${module.enabled.value ? length(var.egress_with_source_security_group_id) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  source_security_group_id = "${lookup(var.egress_with_source_security_group_id[count.index], "source_security_group_id")}"
  ipv6_cidr_blocks         = ["${var.egress_ipv6_cidr_blocks}"]
  prefix_list_ids          = ["${var.egress_prefix_list_ids}"]

  from_port = "${lookup(var.egress_with_source_security_group_id[count.index], "from_port", element(var.rules[lookup(var.egress_with_source_security_group_id[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.egress_with_source_security_group_id[count.index], "to_port", element(var.rules[lookup(var.egress_with_source_security_group_id[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.egress_with_source_security_group_id[count.index], "protocol", element(var.rules[lookup(var.egress_with_source_security_group_id[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.egress_with_source_security_group_id[count.index], "description",
    element(var.rules[lookup(var.egress_with_source_security_group_id[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "cidr_blocks", but without "ipv6_cidr_blocks", "source_security_group_id" and "self"
resource "aws_security_group_rule" "egress_with_cidr_blocks" {
  count = "${module.enabled.value ? length(var.egress_with_cidr_blocks) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  cidr_blocks     = ["${split(",", lookup(var.egress_with_cidr_blocks[count.index], "cidr_blocks", join(",", var.egress_cidr_blocks)))}"]
  prefix_list_ids = ["${var.egress_prefix_list_ids}"]

  from_port = "${lookup(var.egress_with_cidr_blocks[count.index], "from_port", element(var.rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.egress_with_cidr_blocks[count.index], "to_port", element(var.rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.egress_with_cidr_blocks[count.index], "protocol", element(var.rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.egress_with_cidr_blocks[count.index], "description",
    element(var.rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "ipv6_cidr_blocks", but without "cidr_blocks", "source_security_group_id" and "self"
resource "aws_security_group_rule" "egress_with_ipv6_cidr_blocks" {
  count = "${module.enabled.value ? length(var.egress_with_ipv6_cidr_blocks) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  ipv6_cidr_blocks = ["${split(",", lookup(var.egress_with_ipv6_cidr_blocks[count.index], "ipv6_cidr_blocks", join(",", var.egress_ipv6_cidr_blocks)))}"]
  prefix_list_ids  = ["${var.egress_prefix_list_ids}"]

  from_port = "${lookup(var.egress_with_ipv6_cidr_blocks[count.index], "from_port", element(var.rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.egress_with_ipv6_cidr_blocks[count.index], "to_port", element(var.rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.egress_with_ipv6_cidr_blocks[count.index], "protocol", element(var.rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.egress_with_ipv6_cidr_blocks[count.index], "description",
    element(var.rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")], 3)
  )}"
}

# Security group rules with "self", but without "cidr_blocks" and "source_security_group_id"
resource "aws_security_group_rule" "egress_with_self" {
  count = "${module.enabled.value ? length(var.egress_with_self) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  self             = "${lookup(var.egress_with_self[count.index], "self", true)}"
  ipv6_cidr_blocks = ["${var.egress_ipv6_cidr_blocks}"]
  prefix_list_ids  = ["${var.egress_prefix_list_ids}"]

  from_port = "${lookup(var.egress_with_self[count.index], "from_port", element(var.rules[lookup(var.egress_with_self[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.egress_with_self[count.index], "to_port", element(var.rules[lookup(var.egress_with_self[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.egress_with_self[count.index], "protocol", element(var.rules[lookup(var.egress_with_self[count.index], "rule", "_")], 2))}"

  description = "${lookup(var.egress_with_self[count.index], "description",
    element(var.rules[lookup(var.egress_with_self[count.index], "rule", "_")], 3)
  )}"
}

################
# End of egress
################

