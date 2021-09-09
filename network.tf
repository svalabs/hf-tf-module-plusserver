
data "openstack_networking_network_v2" "public_id" {
  name = "kd501107-sva_system_vertrieb_alexander-network"
}

/*
resource "openstack_networking_router_v2" "router_1" {
  name                = "router_${random_id.project.hex}"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public_id.id
}
*/

data "openstack_networking_router_v2" "router" {
  name = "kd501107-sva_system_vertrieb_alexander-router"
}  

resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1_${random_id.project.hex}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name            = "subnet_1_${random_id.project.hex}"
  network_id      = openstack_networking_network_v2.network_1.id
  enable_dhcp     = true
  cidr            = "192.168.199.0/24"
  dns_nameservers = ["10.25.111.2", "8.8.8.8", "8.8.4.4"]
  ip_version      = 4
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = data.openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}


resource "openstack_compute_floatingip_associate_v2" "associations" {
  count       = var.instances
  instance_id = openstack_compute_instance_v2.instances.*.id[count.index]
  floating_ip = openstack_networking_floatingip_v2.fips.*.address[count.index]
}

resource "openstack_networking_floatingip_v2" "fips" {
  count = var.instances
  pool  = var.pool
}