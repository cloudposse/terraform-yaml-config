module "yaml_config" {
  source = "../../"

  map_config_path  = "${path.module}/config/opsgenie-resources"
  list_config_path = "${path.module}/config/service-control-policies"
  pattern          = "*.yaml"

  context = module.this.context
}
