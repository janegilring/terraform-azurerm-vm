locals {
  linux_admin_ssh = lookup(var.admin_user, "ssh_key", null) != null ? true : false

  network_interface_ids = var.network_interface_ids != null ? var.network_interface_ids : [for ni in azurerm_network_interface.machine : ni.id]

  vm_id = local.os_type != "windows" ? azurerm_linux_virtual_machine.machine[0].id : azurerm_windows_virtual_machine.machine[0].id

  image_id_os = var.source_image_id.os == "windows" ? "windows" : "linux"
  image_reference_os = var.source_image_reference.offer == "WindowsServer" ? "windows" : "linux"
  os_type = var.source_image_id.os == null ? local.image_reference_os : local.image_id_os
}
