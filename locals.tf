locals {
  admin_ssh_key          = file("./ssh/id_rsa.pub")
  jump_box_admin_ssh_key = file("./ssh/id_rsa.pub")
}
