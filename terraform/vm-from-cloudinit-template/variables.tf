variable "pve_api_url" {
  type    = string
}

variable "pve_api_token_id" {
  type    = string
}

variable "pve_api_token_secret" {
  type    = string
}

variable "vm_name" {
  type    = string
}

variable "pve_hostname" {
  type    = string
}

variable "vm_id" {
  type    = string
}

variable "vm_count" {
  type    = string
}

variable "vm_cores" {
  type    = string
}

variable "vm_onboot" {
  type    = string
}

variable "vm_memory" {
  type    = string
}

variable "vm_scsihw" {
  type    = string
}

variable "vm_desc" {
  type    = string
}

variable "vm_disk1_datastore" {
  type    = string
}

variable "vm_disk1_size" {
  type    = string
}

variable "vm_disk1_format" {
  type    = string
}

variable "vm_disk1_slot" {
  type    = string
}

variable "vm_nic1_model" {
  type    = string
}

variable "vm_nic1_bridge" {
  type    = string
}

variable "vm_nic1_firewalls" {
  type    = string
}

variable "vm_template" {
  type    = string
}

variable "vm_ipconfig" {
  type    = list(string)
}

variable "ciuser" {
  type    = string
}

variable "cipassword" {
  type    = string
}

variable "sshkeys" {
  type    = string
}