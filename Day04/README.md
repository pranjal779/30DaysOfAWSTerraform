#30DaysOfAWSTerraform Piyush sachdeva

Day 4: State Files and Backends



A Terraform state file is the "single source of truth" that tracks the current state of your managed infrastructure, mapping it to your configuration files so Terraform knows what changes need to be made.



A Terraform state file in a backend is the state file stored in a shared, remote location like an Amazon S3 bucket or Azure Blob Storage or GCP storage.



The primary difference is that a local state file is stored only on the machine running Terraform and is suitable for solo projects or learning, while a remote S3 backend centralizes the state file for team collaboration, security, and durability. 



The remote backend approach is the industry standard for production environments.



The Terraform Statefile Remote Backends like in AWS provide the following advantages: Team Collaboration, State Locking, Durability and High Availability, Security: Encryption at Rest and in Transit and Access Control, Versioning and Recovery.



The Terraform state file backend must be initialized before any resource operations because Terraform needs to know where and how to store and retrieve the state data that tracks your infrastructure. This configuration is placed within the terraform block because it controls the core, low-level behavior and settings of the Terraform CLI itself, not the infrastructure it manages.


```tf
terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }



  backend "s3" {

    bucket       = "day04-tf-bucket-backend"

    key          = "dev/terraform.tfstate"

    region       = "us-east-1"

    encrypt      = true

    use_lockfile = true

  }

}
```


if you try to initialize the Backend before manually creating it, the CLI will throw the following error:

$ terraform init

Initializing the backend...

│ Error: Failed to get existing workspaces: S3 bucket "day04-tf-bucket-backend" does not exist.  

│ Error: operation error S3: ListObjectsV2, https response error StatusCode: 404,

upon successfully creating the S3 bucket manually and initializing of the backend, you will get the following output:

$ terraform init

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically  

use this backend unless the backend configuration changes.

After successful $ terraform applying you will notice the local statefile does not have all the information, the actual statefile is in the S3 bucket with the named day04-tf-bucket-backend, and the path is "dev/terraform.tfstate"



```txt
Day 4: State Files and Backends



A Terraform state file is the "single source of truth" that tracks the current state of your managed infrastructure, mapping it to your configuration files so Terraform knows what changes need to be made.



A Terraform state file in a backend is the state file stored in a shared, remote location like an Amazon S3 bucket or Azure Blob Storage or GCP storage.



The primary difference is that a local state file is stored only on the machine running Terraform and is suitable for solo projects or learning, while a remote S3 backend centralizes the state file for team collaboration, security, and durability. 



The remote backend approach is the industry standard for production environments.



The Terraform Statefile Remote Backends like in AWS provide the following advantages: Team Collaboration, State Locking, Durability and High Availability, Security: Encryption at Rest and in Transit and Access Control, Versioning and Recovery.



The Terraform state file backend must be initialized before any resource operations because Terraform needs to know where and how to store and retrieve the state data that tracks your infrastructure. This configuration is placed within the terraform block because it controls the core, low-level behavior and settings of the Terraform CLI itself, not the infrastructure it manages.



terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }



  backend "s3" {

    bucket       = "day04-tf-bucket-backend"

    key          = "dev/terraform.tfstate"

    region       = "us-east-1"

    encrypt      = true

    use_lockfile = true

  }

}



if you try to initialize the Backend before manually creating it, the CLI will throw the following error:



$ terraform init

Initializing the backend...

│ Error: Failed to get existing workspaces: S3 bucket "day04-tf-bucket-backend" does not exist.  

│ Error: operation error S3: ListObjectsV2, https response error StatusCode: 404,



upon successfully creating the S3 bucket manually and initializing of the backend, you will get the following output:



$ terraform init

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically  

use this backend unless the backend configuration changes.



After successful $ terraform applying you will notice the local statefile does not have all the information, the actual statefile is in the S3 bucket with the named day04-tf-bucket-backend, and the path is "dev/terraform.tfstate" (image in the comment).
```



https://www.youtube.com/watch?v=YsEdrl9O5os&t=324s 
