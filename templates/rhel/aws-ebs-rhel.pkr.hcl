packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      source = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "rhel" {
    ami_name        =
    instance_type   = "t2.micro"
    region         = "us-west-2"
    source_ami_filter {
        filters = {
            name                =
            root-device-type    =
            virtualization-type =
        }
        most_recent = ture
        owners      = []
    }
    ssh_username =
}
build {
    sources = ["source.amazon-ebs.rhel"]

    provisioner "ansible" {
        playbook_file = ""

    }
}