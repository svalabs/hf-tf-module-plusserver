resource "openstack_compute_keypair_v2" "keypair" {
  name = format("%s_%s", var.projectname, random_id.project.hex)
}

resource "random_id" "random_ssh_key_name_string" {
  byte_length = 4
}