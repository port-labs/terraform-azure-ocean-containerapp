module "ocean_integration" {
  source       = "../.."

  # required port parameters so that the integration could communicate with Port
  port = {
    client_id     = var.port_client_id
    client_secret = var.port_client_secret
    base_url = var.port_base_url
  }

  initialize_port_resources = var.initialize_port_resources
  event_listener = var.event_listener

  # required port integration parameters so Port could identify the integration
  integration = {
    type       = var.integration_type
    identifier = var.integration_identifier
    config     = {
    }
  }
  integration_version = var.integration_version

  resource_group_name = var.resource_group_name
  location = var.location

  image = var.image

  additional_secrets = var.additional_secrets
  additional_environment_variables = var.additional_environment_variables
}
