variable "port_client_id" {
  type = string
}

variable "port_client_secret" {
  type = string
}

variable "port_base_url" {
  type = string
  default = ""
}

variable "initialize_port_resources" {
    type = bool
    default = true
    description = "If true, the module will initialize the default port resources (blueprints and relations)"
}

variable "integration_identifier" {
    type = string
    description = "The identifier of the integration"
}

variable "integration_type" {
    type = string
    description = "The type of the integration"
}


variable "location" {
  type    = string
  default = "East US"
  description = "The location to deploy the container to"
}

variable "image" {
  type = string
  default = ""
  description = "The image that the integration will use, if not provided the module will use the latest image"
}

variable "additional_secrets" {
  type = map(string)
  default = {}
  description = "Additional secrets to be injected into the container, the key of the map is the name of the secret and will be the environment variable name, e.g. {MY_SECRET: \"my-secret\"}"
}

variable "additional_environment_variables" {
  type = map(string)
  default = {}
  description = "Additional environment variables to be injected into the container"
}

variable "resource_group_name" {
  type    = string
  default = null
  description = "The resource group to deploy the container to and where the role definition will be created"
}