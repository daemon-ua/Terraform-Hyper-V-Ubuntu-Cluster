variable "server_names" {
  description = "Puppy type Pokemon"
  type        = list(string)
  default     = ["Growlithe", "Lillipup", "Rockruff", "Yamper", "Fidough"]
}
variable "server_count" {
  description = "How many instances should be created?"
  type        = number

  validation {
    condition     = var.server_count >= 1 && var.server_count <= 5 && floor(var.server_count) == var.server_count
    error_message = "Please choose a number between 1-5!"
  }
}
variable "switch_name" {
  type = string
  default = "k3s DMZ"
}
variable "network_adapter" {
  type = string
  default = "Ethernet"
}
variable "HYPERV_USERNAME" {
  description = "Enter the local (Non-Domain Joined) Windows account"
  type = string
}
variable "HYPERV_PASSWORD" {
  description = "Enter the password for the Windows account"
  sensitive = true
  type = string
}
variable "HYPERV_HOST" {
  description = "Enter the name (Non-FQDN) of the Windows host"
  type = string  
}
variable "HYPERV_PORT" {
  type = number
  default = 5986
}
variable "build_notes" {
  default = "Provisioned by Terraform"
}