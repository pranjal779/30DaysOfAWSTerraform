



```pwsh
 get-childItem .

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d----         9/10/2026   1:45 PM                  .terraform
d----         9/11/2026   1:40 AM                  Output-results
d----         9/11/2026   1:15 AM                  Until VPC Transitive connection failure.md
-a---         9/10/2026   1:45 PM           1481   .terraform.lock.hcl
-a---         9/10/2026   6:48 PM           3001   data.tf
-a---         9/11/2026  12:57 AM           1279   local.tf
-a---         9/11/2026   1:12 AM          16832   main.tf
-a---          9/8/2026   9:58 AM            479   providers.tf
-a---          9/8/2026  12:23 PM           1692 󰪷  README.md
-a---          9/8/2026  10:50 PM            220   terraform.tfvars
-a---         9/10/2026   8:25 PM           2475   variable.tf
-a---         9/10/2026  10:26 PM           1706   vpc-peering-task-region-primary.pem
-a---         9/10/2026  10:27 PM           1702   vpc-peering-task-region-secondary.pem
-a---         9/10/2026  10:30 PM           1702   vpc-peering-task-region-third.pem


   pwsh MEM: 68% | 9/13GB   139ms  (base) 
╭─ ♥ 13:01 |                TaskCode 
╰─ 

 get-childItem '.\Until VPC Transitive connection failure.md\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Until VPC Transitive connection failure.md


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d----         9/10/2026  10:41 PM                  apply-result
d----         9/11/2026   1:14 AM                  plan-results
-a---         9/10/2026   8:37 PM           1080   until or before the failure to connect to region C.md

 get-childItem '.\Output-results\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Output-results


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d----         9/11/2026   1:17 AM                  apply-result
d----         9/11/2026   1:15 AM                  plan-results
-a---         9/10/2026  10:31 PM          13382 󰈙  creating-ssh-key-pairs.txt
-a---         9/11/2026   1:41 AM          66221 󰈙  destroy-result.txt


   pwsh MEM: 68% | 9/13GB   37ms  (base) 
╭─ ♥ 13:03 |                TaskCode 
╰─ 


 get-childItem '.\Output-results\apply-result\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Output-results\apply-result


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a---         9/11/2026   1:17 AM          55377 󰈙  apply05.txt

 get-childItem '.\Output-results\plan-results\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Output-results\plan-results


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a---         9/11/2026   1:15 AM          53061 󰈙  plan003.txt


   pwsh MEM: 68% | 9/13GB   22ms  (base) 
╭─ ♥ 13:03 |                TaskCode 
╰─ 

 get-childItem '.\Until VPC Transitive connection failure.md\apply-result\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Until VPC Transitive connection failure.md\apply-result


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a---         9/10/2026   8:11 PM          13183 󰈙  apply00.txt
-a---         9/10/2026   8:48 PM           2152 󰈙  apply01.txt
-a---         9/10/2026   8:50 PM          47693 󰈙  apply02.txt
-a---         9/10/2026  10:05 PM          47693 󰈙  apply03.txt
-a---         9/10/2026  10:41 PM          46863 󰈙  apply04.txt

 get-childItem '.\Until VPC Transitive connection failure.md\plan-results\'

        Directory: C:\Users\pranj\Desktop\my code\30 Days of AWS Terraform\Day15\TaskCode\Until VPC Transitive connection failure.md\plan-results


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a---         9/10/2026   6:49 PM          44573 󰈙  plan00.txt
-a---         9/10/2026  10:40 PM          43987 󰈙  plan002.txt
-a---         9/10/2026   8:38 PM          43845 󰈙  plan01.txt


   pwsh MEM: 68% | 9/13GB   30ms  (base) 
╭─ ♥ 13:07 |                TaskCode 
╰─ 
```


# Resources READ

[aws-providers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

[Customize Terraform configuration with variables - for the aws_region specific documentation](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables)

[Resource: aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

[Resource: aws_default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc)

[Data Source: aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc)

### Subnet related
[List Resource: aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/list-resources/subnet)

[Data Source: aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet)

[Data Source: aws_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets)

[Resource: aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

[Resource: aws_ec2_subnet_cidr_reservation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_subnet_cidr_reservation)


### Data source for AZ
[reference 1 for Data Source for AZ](https://github.com/hashicorp/terraform-provider-aws/blob/main/website/docs/d/availability_zones.html.markdown)
[reference 2 for Data Source for AZ](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)
[Data Source: aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)

