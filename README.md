# A Terraform Module for Hyper-V
A Terraform module that leverages a custom Hyper-V provider (Provided by [taliesins/terraform-provider-hyperv](https://github.com/taliesins/terraform-provider-hyperv)) that will spin up-to 5 VM's that all run a base Ubuntu image. Each VM will pull its name randomly from a pool of Puppy type Pokemon and label it accordingly. Additionally, a virtual switch bridged to the local host adapter is created using this module that will allow the VM's to connect to one another and reach out to DHCP on the LAN the Hyper-V host is running on. Each VM will have dynamic RAM that will adjust accordingly, starting at 512MB per instance and can be used for a k8s/k3s cluster via Ansible configuration.

# Prerequisites
First you'll want to expose your Hyper-V host if not on a domain - That can be done via the following instructions: https://github.com/taliesins/terraform-provider-hyperv#setting-up-server-for-provider-usage

Current configuration use http connection to Hyper-V host, but you can set up https connection according to the instructions above.  
Check any other paths that may be different on your Hyper-V host and update accordingly!

You'll need to have already created a base image for these images which can be specified in the "base_image_path" variable. Simply update this variable with your '*.vhdx' image and this will replicate across all instances that you specify.  Be sure to install guest services in your Ubuntu image, without this it is impossible to create an inventory file for ansible:  

    > echo 'hv_vmbus' >> /etc/initramfs-tools/modules
    > echo 'hv_storvsc' >> /etc/initramfs-tools/modules
    > echo 'hv_blkvsc' >> /etc/initramfs-tools/modules
    > echo 'hv_netvsc' >> /etc/initramfs-tools/modules
    > apt update && apt -y upgrade
    > apt install linux-virtual linux-cloud-tools-virtual linux-tools-virtual
    > update-initramfs -u
    > reboot
  
Edit variables.tf, .ansible_vault_password and group_vars/all files content according to your parameters.

# Known issues
...