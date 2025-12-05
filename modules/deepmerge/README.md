# YAML Config Deepmerge


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_utils"></a> [utils](#provider\_utils) | >= 0.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [utils_deep_merge_yaml.all_map_configs](https://registry.terraform.io/providers/cloudposse/utils/latest/docs/data-sources/deep_merge_yaml) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_list_enabled"></a> [append\_list\_enabled](#input\_append\_list\_enabled) | A boolean flag to enable/disable appending lists instead of overwriting them. | `bool` | `false` | no |
| <a name="input_deep_copy_list_enabled"></a> [deep\_copy\_list\_enabled](#input\_deep\_copy\_list\_enabled) | A boolean flag to enable/disable merging of list elements one by one. | `bool` | `false` | no |
| <a name="input_maps"></a> [maps](#input\_maps) | A list of maps to merge. Maps should be ordered in increasing precedence, i.e. values in a map later in the list will overwrite values in a map earlier in the list. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_merged"></a> [merged](#output\_merged) | The merged map |
<!-- markdownlint-restore -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


