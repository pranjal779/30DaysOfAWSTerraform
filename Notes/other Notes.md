 aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --query "InstanceTypes[].InstanceType" --output table --region us-east-1    
-----------------------                                                                                                                                       
|DescribeInstanceTypes|                                                                                                                                       
+---------------------+                                                                                                                                       
|  c7i-flex.large     |
|  t3.micro           |
|  t4g.small          |
|  t4g.micro          |
|  t3.small           |
|  m7i-flex.large     |
+---------------------+


 $env:TF_VAR_environment = "stage" 

 terraform plan -var=environment=prodc   

Destroy complete! Resources: 4 destroyed.

 history                                                                                                                                                     
                                                                                                                                                              
  Id     Duration CommandLine                                                                                                                                 
  --     -------- -----------                                                                                                                                 
   1        0.258 try { . "c:\Users\pranj\AppData\Local\Programs\Microsoft VS Code\ce099c1ed2\resources\app\out\vs\workbench\contrib\terminal\common\scripts…
   2       20.796 terraform init
   3        2.768 terraform plan
   4        6.624 terraform plan
   5        0.113 terraform plan
   6        4.436 terraform plan
   7        5.749 terraform plan
   8       15.349 terraform apply --auto-approve
   9       15.883 terraform apply --auto-approve
  10       28.945 terraform apply
  11        3.341 aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --query "InstanceTypes[].InstanceType" --output table       
  12        1.035 aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --query "InstanceTypes[].InstanceType" --output table **--… 
  13       11.137 aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --query "InstanceTypes[].InstanceType" --output table --re… 
  14     2:10.367 terraform destroy
  15        0.089 clear
  16       32.472 terraform apply
  17       39.300 terraform apply
  18        0.790 terraform output aws_instance.day05ec2.ami
  19        0.085 terraform out instance_ami
  20        0.762 terraform output instance_ami
  21        0.798 terraform output -raw instance_ami
  22        0.763 terraform output -raw aws_instace.day05ec2.ami
  23        0.003 clear
  24       11.282 terraform plan
  25        0.820 terraform output
  26        0.361 export TF_VAR_environment=stage
  27        0.017 $env:TF_VAR_environment = "stage"
  28       25.237 terraform plan
  29        9.762 terraform plan
  30        0.116 tf plan -var=environment=prodc
  31       14.345 terraform plan -var=environment=prodc
  32        0.087 terraform destory --auto-approve
  33     1:07.477 terraform destroy --auto-approve