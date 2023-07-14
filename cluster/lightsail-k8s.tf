locals {
  hybrid_act_id     = replace(var.instance_userdata, "hybrid_activation_id", var.hybrid_activation_id)
  hybrid_act_code   = replace(local.hybrid_act_id, "hybrid_activation_code", var.hybrid_activation_code)
  hybrid_act_config = replace(local.hybrid_act_code, "hybrid_activation_region", var.hybrid_activation_region)
}

resource "aws_lightsail_instance" "k8s_masters" {
  count             = var.numero_masters
  name              = join("-", [var.cluster_name, "master", "${count.index}"])
  ip_address_type   = "ipv4"
  availability_zone = var.master_azs
  blueprint_id      = var.cluster_blueprint
  bundle_id         = var.master_instance_type
  user_data         = local.hybrid_act_config
  tags = {
    node_type = "master"
  }
}

resource "aws_lightsail_instance" "k8s_workers" {
  count             = var.numero_workers
  name              = join("-", [var.cluster_name, "worker", "${count.index}"])
  ip_address_type   = "ipv4"
  availability_zone = var.worker_azs
  blueprint_id      = var.cluster_blueprint
  bundle_id         = var.worker_instance_type
  user_data         = local.hybrid_act_config
  tags = {
    node_type = "worker"
  }
}
