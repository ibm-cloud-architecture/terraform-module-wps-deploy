# Terraform WPS Provision Module
This terraform module can be used to deploy WebSphere Portal Server on any supported infrastructure vendor.

### Pre-requisites

If the default SSH user is not the root user, the default user must have password-less sudo access.


## Inputs

| variable  |  default  | required |  description    |
|-----------|-----------|---------|--------|
|  wps   |      |  Yes  |   IP address of WPS                 | 
|  ssh_key   |   ~/.ssh/id_rsa   |  No  |   Private key corresponding to the public key that the cloud servers are provisioned with                | 
|  ssh_user   |   root   |  No  |   Username to ssh into the ICP cluster. This is typically the default user with for the relevant cloud vendor                | 
|  generate_key   |   False   |  No  |   Whether to generate a new ssh key for use by ICP Boot Master to communicate with other nodes                | 



## Usage example

```hcl
module "wps-provision" {
    source = "github.com/ibm-cloud-architecture/terraform-module-wps-deploy"
    
    wps = ["${softlayer_virtual_guest.wps.ipv4_address}"]
    
    # We will let terraform generate a new ssh keypair 
    # for boot master to communicate with worker and proxy nodes
    # during WPS deployment
    generate_key = true
    
    # SSH user and key for terraform to connect to newly created SoftLayer resources
    # ssh_key is the private key corresponding to the public keyname specified in var.key_name
    ssh_user  = "root"
    ssh_key   = "~/.ssh/id_rsa"
} 
```




