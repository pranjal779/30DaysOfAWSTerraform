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

<img width="1867" height="1147" alt="Screenshot 2026-03-13 005704" src="https://github.com/user-attachments/assets/cf41b10e-607e-49b2-a56a-d292936a401f" />
<img width="1885" height="1086" alt="Screenshot 2026-03-13 010016" src="https://github.com/user-attachments/assets/27c9ec61-6b24-4c22-978e-7789a42aa5d2" />
<img width="1132" height="972" alt="Screenshot 2026-03-13 010208" src="https://github.com/user-attachments/assets/3bbea716-3d11-435c-80c3-656a3330e3ae" />
<img width="860" height="791" alt="Screenshot 2026-03-13 011820" src="https://github.com/user-attachments/assets/c14b1390-dd4d-45eb-9d80-19ce00bebd0c" />
<img width="1216" height="427" alt="Screenshot 2026-03-13 011350" src="https://github.com/user-attachments/assets/1926e15e-93da-4486-9fd9-ebd7bda9dfc9" />
<img width="693" height="462" alt="Screenshot 2026-03-13 011403" src="https://github.com/user-attachments/assets/8fc864a1-805a-4d9f-a8f9-e3b629977f35" />
<img width="1078" height="506" alt="Screenshot 2026-03-13 011438" src="https://github.com/user-attachments/assets/764de275-6b42-4c00-bd00-40b3774be5bf" />
<img width="677" height="273" alt="Screenshot 2026-03-13 011545" src="https://github.com/user-attachments/assets/f2e0e9d9-0d35-4736-9bbc-042babbea2d1" />
<img width="1595" height="706" alt="Screenshot 2026-03-13 011711" src="https://github.com/user-attachments/assets/0c3cbe98-a1fa-46a7-b81c-8c3fd4c6a240" />
<img width="330" height="72" alt="Screenshot 2026-03-13 012003" src="https://github.com/user-attachments/assets/595332d2-5952-4db0-ae4b-55fe7b8498f1" />


