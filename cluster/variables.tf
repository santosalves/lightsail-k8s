# curl -sfL https://get.k3s.io | K3S_TOKEN="12345" K3S_KUBECONFIG_MODE="644" sh -

variable "cluster_blueprint" {
  type    = string
  default = "ubuntu_22_04"
}

variable "master_instance_type" {
  type    = string
  default = "micro_2_0"
}

variable "worker_instance_type" {
  type    = string
  default = "micro_2_0"
}

variable "master_azs" {
  type    = string
  default = "us-east-2a"
}

variable "worker_azs" {
  type    = string
  default = "us-east-2b"
}

variable "numero_masters" {
  type    = number
  default = 1
}

variable "numero_workers" {
  type    = number
  default = 1
}

variable "cluster_name" {
  type    = string
  default = "AprendaAWS-k8s"
}

variable "hybrid_activation_code" {
  type      = string
  default   = "knPwlwprFKDm3/dQ/sOB"
  sensitive = true
}

variable "hybrid_activation_id" {
  type      = string
  default   = "f954a153-a22f-4d36-b5c1-706e9450dfcb"
  sensitive = true
}

variable "hybrid_activation_region" {
  type    = string
  default = "us-east-2"
}

variable "instance_userdata" {
  type    = string
  default = "sudo apt update && sudo apt install unzip plocate -y && sudo /snap/amazon-ssm-agent/6312/amazon-ssm-agent -register -y -id 'hybrid_activation_id' -code 'hybrid_activation_code' -region 'hybrid_activation_region' && sudo snap restart amazon-ssm-agent"
}
