terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_ssh_key" "deployer" {
  name   = "droplet-key"
  public_key = "${var.ssh_key}"
}

resource "digitalocean_droplet" "namelivia" {
  image  = "ubuntu-18-04-x64"
  name   = "${var.name}"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.deployer.fingerprint]
}
