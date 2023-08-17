# Ocean Integration Azure ContainerApp Terraform module

Terraform module which creates Ocean Integration on Azure ContainerApp.


## Usage

```hcl
module "ocean-containerapp_example_azure-integration" {
  source  = "port-labs/ocean-containerapp/azure//examples/azure-integration"
  version = "0.0.1"
  
  port_client_id = "xxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  port_client_secret = "xxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  subscription_id = "xxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  
}

