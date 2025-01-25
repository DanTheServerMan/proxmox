# This defines our provider and necessary information to utilize the provider
# Documentation can be found here: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/guides/developer
provider "proxmox" {
  pm_api_url = var.pve_api_url
  pm_api_token_id = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret 
  pm_tls_insecure = true
}

# Using our provider, we're defining a new resources called "vm"
# The name, cores, memory, etc. have all been converted to a variable in vars.tf
resource "proxmox_vm_qemu" "vm" {
 name        = "${var.vm_name}-${count.index + 1}" # Example: vm_name is 'test', count is 3. This will name VMs "test-1, test-2, test-3"
 target_node = var.pve_hostname
 vmid        = var.vm_id + count.index
 count       = var.vm_count
 cores       = var.vm_cores
 memory      = var.vm_memory
 onboot      = var.vm_onboot
 scsihw      = var.vm_scsihw
 desc        = var.vm_desc
 clone       = var.vm_template # This is a full (not linked) clone operation. It is REQUIRED for use w/ cloudinit
 ipconfig0   = var.vm_ipconfig[count.index]
 force_create = true # This will cause Terraform to regen the cloudinit image on the VM after its cloned, which in my testing was necessary
 
 # User information
 ciuser      = var.ciuser
 cipassword  = var.cipassword
 sshkeys = var.sshkeys


 # This defines a disk, its location, size (In GiB), format (ex. qcow2, raw, etc.), type, and slot (ex. scsi0)
 disk {
   storage = var.vm_disk1_datastore
   size = var.vm_disk1_size
   format = var.vm_disk1_format
   type = "disk"
   slot = var.vm_disk1_slot
 }

disk {
  storage = var.vm_disk1_datastore
  type    = "cloudinit"  
  slot = "ide0"
}


 # This defines the NIC of our VM, its emulation type, which PVE host bridge it is assigned to, and toggles the firewall
 network {
   model = var.vm_nic1_model
   bridge = var.vm_nic1_bridge
   firewall = var.vm_nic1_firewalls
  }

  serial {
   id = 0
 }
}