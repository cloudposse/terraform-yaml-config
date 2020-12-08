enabled = true

map_config_local_base_path = "./config"

map_config_paths = [
  "map-configs/*.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-opsgenie-incident-management/master/examples/config/resources/services.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-opsgenie-incident-management/master/examples/config/resources/team_routing_rules.yaml"
]

list_config_local_base_path = "./config"

list_config_paths = [
  "list-configs/*.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-aws-service-control-policies/master/catalog/organization-policies.yaml"
]

parameters = {
  param1 = "1"
  param2 = "2"
}
