 terrafomr plan
terrafomr: The term 'terrafomr' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
 terraform plan
var.aws_vpc
Enter a value: 2

╷
│ Error: Reference to undeclared resource
│
│ on main.tf line 18, in data "aws_subnet" "shared":
│ 18: vpc_id = data.aws_vpc.vpc_name.id
│
│ A data resource "aws_vpc" "vpc_name" has not been declared in the root module.
╵
 terraform plan
var.aws_vpc
Enter a value: self

data.aws_ami.linux2: Reading...
data.aws_vpc.vpc_day13: Reading...
data.aws_region.current: Reading...
data.aws_region.current: Read complete after 0s [id=us-east-1]

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: no matching EC2 VPC found
│
│ with data.aws_vpc.vpc_day13,
│ on main.tf line 6, in data "aws_vpc" "vpc_day13":
│ 6: data "aws_vpc" "vpc_day13" {
│
╵
╷
│ Error: Your query returned no results. Please change your search criteria and try again.
│
│ with data.aws_ami.linux2,
│ on main.tf line 25, in data "aws_ami" "linux2":
│ 25: data "aws_ami" "linux2" {
│
╵

   pwsh MEM: 73% | 10/13GB   18s 255ms  (base) 
╭─ ♥ 19:10 |         Day13
