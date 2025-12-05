terraform {
  required_version = ">= 1.0"
  
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "b2" {
  application_key_id = var.b2_application_key_id
  application_key    = var.b2_application_key
}