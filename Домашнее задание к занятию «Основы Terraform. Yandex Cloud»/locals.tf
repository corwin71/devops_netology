locals {
  vm_web_computed_name = "${var.vpc_name}-${var.vm_web_name}"
  vm_db_computed_name  = "${var.vpc_name}-${var.vm_db_name}"
}
