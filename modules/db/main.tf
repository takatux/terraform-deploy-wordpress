resource "openstack_compute_instance_v2" "instance" {
  name             = "${var.instance_name}"
  image_name       = "${var.instance_image}"
  flavor_name      = "${var.instance_flavor}"
  key_pair         = "${var.instance_keypair}"
   security_groups  = ["default"]
  network {
    uuid = "${var.network_id}"
    fixed_ip_v4 = "${var.instance_int_address}"
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool  = "extnet"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.floating_ip.address}"
  instance_id = "${openstack_compute_instance_v2.instance.id}"
  provisioner "file" {
    connection {
      host     = "${openstack_networking_floatingip_v2.floating_ip.address}"
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("${var.private_key_path}")}"
    }

    source      = "/latihan/quiz2/deploywordpress/file/provisioning_db.sh"
    destination = "/home/ubuntu/provisioning_db.sh"
  }

  provisioner "remote-exec" {
    connection {
      host     = "${openstack_networking_floatingip_v2.floating_ip.address}"
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("${var.private_key_path}")}"
    }

    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install mariadb-server",
      "sudo sed -i 's/127.0.0.1/0.0.0.0/g'  /etc/mysql/mariadb.conf.d/50-server.cnf",
      "sudo systemctl retart mariadb",
      "sed -i 's/username/${var.mysql_username}/g' /home/ubuntu/provisioning_db.sh", 
      "sed -i 's/password/${var.mysql_password}/g' /home/ubuntu/provisioning_db.sh",
      "sed -i 's/databasename/${var.mysql_database}/g' /home/ubuntu/provisioning_db.sh",
      "sudo chmod +x /home/ubuntu/provisioning_db.sh",
      "sudo bash /home/ubuntu/provisioning_db.sh",
      "sudo rm -f /home/ubuntu/provisioning_db.sh"
    ]
  }
}

