# Terraform variables
Terraform variables, specifically input variables, serve as parameters for modules, making configurations reusable and dynamic by allowing users to pass custom values at runtime without altering the source code. 
They are a fundamental part of writing modular and flexible Infrastructure as Code (IaC).

## Declaring Variables
Variables are declared using a variable block, typically in a dedicated file named variables.tf.

```hcl
variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "The instance type must not be empty."
  }
  sensitive = false
}
```


Key arguments within a variable block include:

- type: Specifies the data type (e.g., string, number, bool, list, map, object, set, tuple).
- default: A fallback value if no other value is provided, making the variable optional.
- description: Documents the variable's purpose for users of the module.
- validation: A block to enforce custom rules on the variable's value, in addition to type constraints.
- sensitive: When set to true, Terraform redacts the value in CLI output (plan/apply logs) to prevent exposure of secrets like passwords. Note that sensitive values are still stored in the state file.
- nullable: Controls whether the variable can be assigned a null value.

Using Variables
Variables are referenced within configuration files using the var.<variable_name> syntax

```hcl
resource "aws_instance" "web" {
  instance_type = var.instance_type
  # ...
}

```

## Assigning Values
Values can be assigned to root module variables through several methods, which Terraform resolves in a specific order of precedence:

- CLI arguments: Using the -var='key=value' flag.
- CLI variable files: Using the -var-file='path/to/file.tfvars' flag.
- Automatically loaded files: Files named exactly terraform.tfvars or terraform.tfvars.json, and any files ending in *.auto.tfvars or *.auto.tfvars.json.
- Environment variables: Environment variables prefixed with TF_VAR_ (e.g., TF_VAR_instance_type).
- Default values: The default value defined in the variable block.


If no value is provided and no default is set, Terraform will prompt the user to input a value interactively. 

For more in-depth guidance, the HashiCorp Developer documentation provides comprehensive details. 


Terraform determines the value of a variable by using a specific order of precedence, where values from higher-priority sources override those from lower-priority sources. [1, 2]  
Precedence Order (Highest to Lowest Priority) 

1. Command-line arguments: Values specified with the -var and -var-file options during a Terraform command (e.g., terraform plan -var="region=us-east-1") have the highest precedence. They are processed in the order provided on the command line.
2.  *.auto.tfvars or *.auto.tfvars.json files: Terraform automatically loads all files in the current directory that end with these suffixes. Files are processed in lexical (alphabetical) order.
3.  terraform.tfvars.json file: This specific file is automatically loaded if present in the current directory.
4.  terraform.tfvars file: This specific file is automatically loaded if present in the current directory.
5. Environment variables: Any environment variables with the prefix TF_VAR_ (e.g., TF_VAR_region) are used. These have lower precedence than variable files or command-line arguments.
6. Default value: If a variable has a default argument in its variable block, that value will be used only if no value is provided by any of the higher precedence methods.
7. User prompt: If a variable is declared without a default value and no value is provided through any other method, Terraform will interactively prompt the user to enter a value.

Understanding this hierarchy helps in managing configurations across different environments and ensuring predictable behavior in your infrastructure deployments. The official Terraform documentation on input variables provides further details. [7, 8]  



[1] https://developer.hashicorp.com/terraform/language/values/variables
[2] https://wintelguy.com/2025/understanding-terraform-variable-precedence.html
[3] https://www.linkedin.com/posts/akkc01_in-terraform-variable-precedence-refers-activity-7325037211886702593-dKvj
[4] https://developer.hashicorp.com/terraform/language/block/variable
[5] https://www.youtube.com/watch?v=5siUa3Kdk08
[6] https://medium.com/@shabarimeda/terraform-variables-input-local-output-precedence-deep-dive-2a9a9c83ecb2
[7] https://medium.com/@fnizi.ayoub/terraform-variable-precedence-a-complete-guide-ffa4ce65c4f4
[8] https://sajidm.com/azure-terraform-part-9-terraform-variables

