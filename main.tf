resource "openstack_compute_instance_v2" "instances" {
  count           = var.instances
  name            = format("%s-%s-%02d-%s", var.projectname, var.instancename, count.index + 1, random_id.project.hex)
  flavor_name     = var.flavor
  image_name      = var.os
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [openstack_networking_secgroup_v2.secgroup.id]
  network {
    uuid = "7553dc56-9afb-462b-97a1-56c5d7707df2"
    name = "kd501107-sva_system_vertrieb_alexander-network"
  }
}


resource "openstack_compute_volume_attach_v2" "volume_attachments" {
  count       = var.instances
  instance_id = openstack_compute_instance_v2.instances.*.id[count.index]
  volume_id   = openstack_blockstorage_volume_v2.volumes.*.id[count.index]
}


resource "openstack_blockstorage_volume_v2" "volumes" {
  count = var.instances
  size  = var.disksize
  name  = format("%s-vol_%02d-%s", var.instancename, count.index + 1, random_id.project.hex)
}