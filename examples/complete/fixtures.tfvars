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

map_configs = [
  {
    key3 = {
      name  = "name3_override"
      param = "param3_override"
    },
    key4 = {
      name  = "name4"
      param = "param4"
      type  = "type4"
    },
    key5 = {
      name  = "name5"
      param = ["param5a", "param5b"]
      type  = "type5"
    }
  },
  {
    key6 = {
      name  = "name6"
      param = "param6"
      type  = "type6"
    },
    key1 = [
      {
        name  = "name1_override"
        param = "param1_override"
      }
    ]
  }
]
