[15/30 - AWS VPC Peering Using Terraform - Mini project](https://www.youtube.com/watch?v=WGt000THDmQ&list=PLl4APkPHzsUWr5H7mprC8O21Crq_NnbYx&index=16)

[Resource: aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) -> 14:33  


### 23:56
[reference 1 for Data Source for AZ](https://github.com/hashicorp/terraform-provider-aws/blob/main/website/docs/d/availability_zones.html.markdown)
[reference 2 for Data Source for AZ](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)
[Data Source: aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)
[Terraform Data Sources – How They Are Utilized](https://spacelift.io/blog/terraform-data-sources-how-they-are-utilised)
[How to Use Data Sources for Availability Zone Discovery in Terraform](https://oneuptime.com/blog/post/2026-02-23-terraform-availability-zone-discovery/view)

## Additional Resources

- [AWS VPC Peering Documentation](https://docs.aws.amazon.com/vpc/latest/peering/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [VPC Peering Best Practices](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html)

[Data Source: aws_ami - for owners argument](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#example-usage)

owners - (Optional) List of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft).

[Data Source: aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway)

[List Resource: aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/list-resources/internet_gateway)


[Resource: aws_main_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association)

[Resource: aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)



#### Error for StatusCode400 InvalidKeyPair.NotFound: The key pair 'vpc-peering-demo-west' does not exist in tfvars file
**[45:05](https://youtu.be/WGt000THDmQ?si=xA9_tO5oWVzXY1pL&t=2705)**

