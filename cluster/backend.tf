terraform {
  backend "s3" {
    bucket  = "aprendaaws-lightsail-k8s"
    key     = "*"
    region  = "us-east-2"
    encrypt = true
  }
}
