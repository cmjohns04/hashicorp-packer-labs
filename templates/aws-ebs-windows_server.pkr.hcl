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

source "amazon-ebs" "windows" {
    ami_name        =
    communicator    =
    instance_type   = "t2.micro"
    region         = "us-west-2"
    source_ami_filter {
        filters = {
            name                =
            root-device-type    =
            virtualization-type =
        }
        most_recent = true
        owners      = []
    }
    user_data_file  = 
    winrm_insecure  = true
    winrm_use_ssl   = false
    winrm_username  = "Admnistrator"

}
