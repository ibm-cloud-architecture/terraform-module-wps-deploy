## Actions that has to be taken on all nodes in the cluster

## Actions that needs to be taken on boot master only
resource "null_resource" "wps" {

  # The first master is always the boot master where we run provisioning jobs from
  connection {
    host = "${var.wps}"
    user = "${var.ssh_user}"
    private_key = "${tls_private_key.ssh.private_key_pem}"
  } 

  
  provisioner "remote-exec" {
    inline = [
      "/opt/IBM/WebSphere/wp_profile/bin/startServer.sh WebSphere_Portal"
    ]
  }
}

