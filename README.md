## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_synthetics_global_variable.global_variable](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_global_variable) | resource |
| [datadog_synthetics_test.synthetics_test](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | n/a | `string` | `"MyDashboard"` | no |
| <a name="input_datadog_synthetics_test_name"></a> [datadog\_synthetics\_test\_name](#input\_datadog\_synthetics\_test\_name) | n/a | `string` | n/a | yes |
| <a name="input_global_variable_description"></a> [global\_variable\_description](#input\_global\_variable\_description) | n/a | `string` | `"Global Variable"` | no |
| <a name="input_global_variable_name"></a> [global\_variable\_name](#input\_global\_variable\_name) | n/a | `string` | n/a | yes |
| <a name="input_global_variable_value"></a> [global\_variable\_value](#input\_global\_variable\_value) | n/a | `string` | n/a | yes |
| <a name="input_monitor_name"></a> [monitor\_name](#input\_monitor\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
