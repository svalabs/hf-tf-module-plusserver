output "private_key" {
  value = openstack_compute_keypair_v2.keypair.private_key
}

output "private_ip" {
  value = openstack_compute_instance_v2.instances[*].network[0].fixed_ip_v4
}

output "public_ip" {
  value = openstack_compute_floatingip_associate_v2.associations[*].floating_ip
}

output "hostname" {
  value = openstack_compute_instance_v2.instances[*].name
}
