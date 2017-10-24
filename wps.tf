## Actions that has to be taken on all nodes in the cluster

## Actions that needs to be taken on boot master only
resource "null_resource" "icp-boot" {

  # The first master is always the boot master where we run provisioning jobs from
  connection {
    host = "${element(var.wps, 0)}"
    user = "${var.ssh_user}"
    private_key = "${file(var.ssh_key)}"
  } 

  
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/banana"
    ]
  }
}

