provider "openstack" {
  user_name   = var.os_user_name
  tenant_name = var.os_tenant_name
  password    = var.os_password
  auth_url    = var.auth_url
#  region      = "regionOne"
  insecure    = "true"
  domain_name = "pco"
}