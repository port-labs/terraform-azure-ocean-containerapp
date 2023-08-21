variable "port_client_id" {
  type = string
  description = "The Port client id"
}
variable "port_client_secret" {
  type = string
  description = "The Port client secret"
}
variable "port_base_url" {
  type = string
  default = "https://api.getport.io"
  description = "The Port base url, if not provided the module will use the prod url"
}
variable "event_grid_system_topic_name" {
  type = string
  default = ""
  description = "If the event grid topic name is not provided, the module will create a new one"
}
variable "event_grid_resource_group" {
  type = string
  default = ""
    description = "If the event grid resource group is not provided, the module will use the resource group of the event grid topic for the subscription event grid topic"
}
variable "resources_filter_values" {
  type = list(string)
  default = [
        "microsoft.app/containerapps",
        "Microsoft.ContainerService/managedClusters",
        "Microsoft.Network/loadBalancers",
        "Microsoft.Compute/virtualMachine",
        "Microsoft.Resources/subscriptions/resourceGroups",
        "Microsoft.Storage/storageAccounts",
  ]
  description = "The list of resources that integration will receive events for"
}
variable "included_event_types" {
  type = list(string)
  default = [
    "Microsoft.Resources.ResourceWriteSuccess",
    "Microsoft.Resources.ResourceWriteFailure",
    "Microsoft.Resources.ResourceDeleteSuccess",
    "Microsoft.Resources.ResourceDeleteFailure",
  ]
  description = "The list of event types to be included in the subscription event grid topic, for more information see https://learn.microsoft.com/en-us/azure/event-grid/event-schema-subscriptions?tabs=event-grid-event-schema#available-event-types"
}

variable "action_permissions_list" {
  type = list(string)
  default = [
      "Microsoft.Resources/subscriptions/resources/read",
      "microsoft.app/containerapps/read",
      "Microsoft.Storage/storageAccounts/*/read",
      "Microsoft.ContainerService/managedClusters/read",
      "Microsoft.Network/loadBalancers/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Compute/virtualMachines/read",
  ]
  description = "The list of permissions that will be granted to the integration user"
}

variable "image" {
  type = string
  default = ""
  description = "The image that the integration will use, if not provided the module will use the latest image"
}

variable "initialize_port_resources" {
    type = bool
    default = true
    description = "If true, the module will initialize the default port resources (blueprints and relations)"
}

variable "subscription_id" {
  type    = string
  description = "The scope of the integration (e.g (00000000-0000-0000-0000-000000000000)"
}

variable "location" {
  type    = string
  default = "East US"
  description = "The location to deploy the container to"
}

variable "resource_group_name" {
  type    = string
  default = null
  description = "The resource group to deploy the container to and where the role definition will be created"
}

variable "integration_version" {
  type    = string
  default = "latest"
  description = "The version of the integration to deploy"
}

variable "integration_type" {
    type    = string
    default = "azure"
    description = "The type of the integration to deploy"
}

variable "integration_identifier" {
    type    = string
    default = "azure"
    description = "The identifier of the integration to deploy"
}

variable "event_listener" {
  type = object({
    type = string

    # POLLING
    resync_on_start = optional(bool)
    interval        = optional(number)

    # WEBHOOK
    app_host = optional(string)


    # KAFKA
    brokers                  = optional(list(string))
    security_protocol        = optional(list(string))
    authentication_mechanism = optional(list(string))
    kafka_security_enabled   = optional(list(bool))
    consumer_poll_timeout    = optional(list(number))
  })

  default = {
    type = "POLLING"
  }
  description = "The event listener configuration"
}
