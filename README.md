# hashicorp-packer-labs
Hashicorp Packer Home Lab Examplse

salt=$(openssl rand -hex 16)

hashed_password=$(openssl passwd -salt "$salt" "ubuntu") 

echo $hashed_password  

1. To create a ubuntu image, type the command "packer build templates/vmware-ubuntu.pkr.hcl

