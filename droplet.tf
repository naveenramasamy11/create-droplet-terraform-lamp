variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "lamp" {
    image = "centos-7-x64"
    name = "automation-lamp-1"
    region = "blr1"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
    connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }

provisioner "file" {
    source = "provisional.yml"
    destination = "/root/"
}

provisoner "file" {
    source = "roles"
    destination = "/root"
}

provisoner "file" {
    source = "slack.yml"
    destination = "/root"
}
provisioner "remote-exec" {
    inline = [
      "yum install -y ansible epel-release",
      "ansible-playbook /root/slack.yml --tags='provision'"
      "ansible-playbook /root/provisonal.yml",
      "ansible-playbook /root/slack.yml --tags='lamp'",
    ]
  }
}
