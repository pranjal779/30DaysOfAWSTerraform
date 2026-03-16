A few small notes to improve your understanding:

1️⃣ Region inside the resource

This line in aws_instance:

region = var.config_type_object.region

will not work because region belongs to the provider, not the resource.

Correct approach:

provider "aws" {
region = var.config_type_object.region
}

Remove region from the resource.

2️⃣ Good use of count

This is correct:

count = var.instance_count

That means Terraform will create multiple EC2 instances.

4️⃣ Small Terraform tip

You used:

var.allowed_instance_type[0]

That works, but usually you would use something like:

instance_type = var.allowed_instance_type[count.index]

when creating multiple instances.

But that's a more advanced pattern.
