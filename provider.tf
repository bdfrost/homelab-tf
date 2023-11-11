# module "k3s" {
#   source                = "diogosilva30/k3s/proxmox"
#   version               = "1.11.0"
#   proxmox_vm_image_name = "ubuntu-jammy-cloudinit-template"
#   ssh_private_key_path  = var.ssh_private_key_path
#   ciuser                = var.ciuser
#   cluster_name          = var.cluster_name
#   ssh_public_key_path   = var.ssh_public_key_path
# }

terraform {
  cloud {
    organization = "froste"
    workspaces {
      name = "homelab-tf"
    }
  }
  required_providers {
    # https://github.com/Telmate/terraform-provider-proxmox
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.3"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.1.0"
}

provider "proxmox" {
  pm_tls_insecure     = true
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}
