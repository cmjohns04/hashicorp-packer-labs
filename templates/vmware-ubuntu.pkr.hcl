packer {
  required_plugins {
    vmware = {
      source  = "github.com/hashicorp/vmware"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

variable "iso_url" {
  default = "https://cdimage.ubuntu.com/releases/20.04.5/release/ubuntu-20.04.5-live-server-arm64.iso"
}

variable "iso_checksum" {
  default = "sha256:e42d6373dd39173094af5c26cbf2497770426f42049f8b9ea3e60ce35bebdedf"
}

variable "vm_guest_name" {
  default = "packer-ubuntu-2204-{{ timestamp }}"
}

source "vmware-iso" "ubuntu" {
  output_directory     = "builds/${var.vm_guest_name}"
  vm_name              = var.vm_guest_name
  iso_url              = var.iso_url
  iso_checksum         = var.iso_checksum
  cdrom_adapter_type   = "sata"
  disk_adapter_type    = "sata"
  network_adapter_type = "e1000e"
  version              = 21
  guest_os_type        = "arm-ubuntu-64"
  headless             = true
  ssh_username         = "ubuntu"
  ssh_password         = "ubuntu"
  ssh_timeout          = "30m"
  shutdown_command     = "echo 'ubuntu' | sudo -S shutdown -P now"
  disk_size            = 60000
  disk_type_id         = 0
  memory               = 4096
  cpus                 = 4
  boot_wait            = "10s"
  firmware             = "efi"
  http_directory       = "http"
  boot_command         = ["<wait><esc>linux /casper/vmlinuz quiet autoinstall ds='nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu/'<enter>initrd /casper/initrd<enter>boot<enter>"]
  vmx_data = {
    "cpuid.coresPerSocket"    = "2"
    "ethernet0.pciSlotNumber" = "32"
    "svga.autodetect"         = true
    "usb_xhci.present"        = true
    "msg.autoAnswer"          = "TRUE"
  }
}


build {
  sources = ["source.vmware-iso.ubuntu"]
}