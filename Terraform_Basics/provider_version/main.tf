terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_integer" "name" {
    min = 0
    max = 100
  
}