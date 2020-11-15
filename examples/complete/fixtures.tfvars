enabled = true

map_yaml_config_paths = [
  "config/opsgenie-resources/*.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-opsgenie-incident-management/master/examples/config/resources/services.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-opsgenie-incident-management/master/examples/config/resources/team_routing_rules.yaml"
]

list_yaml_config_paths = [
  "config/service-control-policies/*.yaml",
  "https://raw.githubusercontent.com/cloudposse/terraform-aws-service-control-policies/master/examples/complete/policies/organization-policies.yaml"
]
