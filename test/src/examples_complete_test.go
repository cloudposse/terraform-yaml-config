package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	mapConfigs := terraform.OutputMap(t, terraformOptions, "map_configs")
	// Verify we're getting back the outputs we expect
	assert.Greater(t, len(mapConfigs), 0)

	// Run `terraform output` to get the value of an output variable
	listConfigs := terraform.OutputList(t, terraformOptions, "list_configs")
	// Verify we're getting back the outputs we expect
	assert.Greater(t, len(listConfigs), 0)
}
