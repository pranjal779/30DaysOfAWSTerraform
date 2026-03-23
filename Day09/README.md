# 9/30 - AWS Terraform Lifecycle Rules

# [lifecycle meta-argument reference | Terraform](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

[Amazon Linux AMI](https://aws.amazon.com/amazon-linux-ami/)

Terraform lifecycle meta-arguments (create_before_destroy, prevent_destroy, ignore_changes, replace_triggered_by)
customize how Terraform manages resource creation, updates, and destruction within the lifecycle block.
These rules allow for zero-downtime deployments, protection against accidental deletion, and ignoring external attribute changes.

## Key Lifecycle Rules & Behavior

1. create_before_destroy (bool): Creates replacement resources before destroying the old one, enabling zero-downtime updates. This setting propagates to dependencies.
2. prevent_destroy (bool): Protects critical resources (e.g., databases) by causing Terraform to error if a destroy action is attempted.
3. ignore_changes (list): Instructs Terraform to skip updates for specified resource attributes, useful for tags or settings managed by external processes (e.g., autoscaling).
4. replace_triggered_by (list): Replaces a resource when another specified resource changes, typically used for dependency chain updates (available in Terraform v1.2+)

## Best Practices

Use prevent_destroy for crucial, stateful infrastructure.
Use create_before_destroy for stateless resources behind load balancers.
Document ignore_changes to explain why certain attributes are ignored.
Test lifecycle behaviors in non-production environments to avoid unexpected replacement ordering.

# [Resource: aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)

### VPC (Virtual Private Cloud)

# [Resource: aws_default_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl)

### According to the Documentation: [Argument Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#argument-reference) lifecycle_rule - is Optional and Deprecated

- lifecycle_rule - (Optional, Deprecated) Configuration of object lifecycle management. See Lifecycle Rule below for details. Terraform will only perform drift detection if a configuration value is provided. Use the resource aws_s3_bucket_lifecycle_configuration instead.
- [Validate your configuration](https://developer.hashicorp.com/terraform/language/validate)
- Meta Data Sources>Data Sources>aws_region/aws_regions: [Data Source: aws_regions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/regions)
