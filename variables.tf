variable "wps" { 
  description =  "IP address of WPS."
}

variable "ssh_user" {
  description = "Username to ssh into the ICP cluster. This is typically the default user with for the relevant cloud vendor"
  default     = "root"
}

variable "ssh_key" {
  description = "Private key corresponding to the public key that the cloud servers are provisioned with"
  default     = "~/.ssh/id_rsa"
}


