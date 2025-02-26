variable "HYPERV_USERNAME" {
  description = "Enter the local (Non-Domain Joined) Windows account"
  type        = string
  default     = "terraform"
}
variable "HYPERV_PASSWORD" {
  description = "Enter the password for the Windows account"
  sensitive   = true
  type        = string
  default     = "terraform"
}
variable "HYPERV_HOST" {
  description = "Enter the name (Non-FQDN) of the Windows host"
  type        = string
  default     = "172.26.96.1"
}
variable "HYPERV_PORT" {
  type    = number
  default = 5985
}
variable "switch_name" {
  type    = string
  default = "k8s DMZ"
}
variable "network_adapter" {
  description = "Please enter the name of the NIC to be bound/bridged to your virtual switch:"
  type        = string
  default     = "Ethernet"
}
variable "build_notes" {
  default = "Provisioned by Terraform"
}
variable "leader_server_count" {
  description = "How many leader instances should be created?"
  type        = number
  default     = 1
  validation {
    condition     = var.leader_server_count >= 1 && var.leader_server_count <= 3 && floor(var.leader_server_count) == var.leader_server_count
    error_message = "Please choose a number between 1-3!"
  }
}
variable "worker_server_count" {
  description = "How many worker instances should be created?"
  type        = number
  default     = 2
  validation {
    condition     = var.worker_server_count >= 1 && var.worker_server_count <= 27 && floor(var.worker_server_count) == var.worker_server_count
    error_message = "Please choose a number between 1-27!"
  }
}
variable "base_image_path" {
  description = "Please specify the '.vhdx' file that will be cloned for all nodes"
  type        = string
  default     = "C:\\Hyper-V\\templates\\Ub24template.vhdx"
}
variable "working_path" {
  description = "Please specify the location used to store all created '.vhdx' files for all nodes"
  type        = string
  default     = "C:\\Hyper-V\\k8s"
}
variable "domain" {
  description = "Please enter the domain that you would like to use for your cluster"
  type        = string
  default     = ".local"
}
