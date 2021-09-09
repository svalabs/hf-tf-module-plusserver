#################################
# Variablen Credentinals
#################################

variable "os_user_name" { }

variable "os_tenant_name" { }

variable "os_password" { }

variable "auth_url" {
  default = "https://prod1.api.pco.get-cloud.io:5000"
}

variable "projectname" {
  default = "tf-plus"
}

variable "instancename" {
  default = "tf-vm"
}

variable "pool" {
  default = "ext01"
}

#################################
# Variablen Instanz
#################################
variable "instances" {
  default = "1"
}

variable "os" {
  default = "CentOS 8"
}
variable "flavor" {
  default = "2C-2GB-20GB"
}
variable "disksize" {
  default = "25"
}
