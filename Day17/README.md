# Architecture Diagram

<img width="1536" height="1024" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/f930b688-b90b-45b7-91ad-a2ef98d7edb9" />

# 🚀 Day 17 of #30DaysofAWSTerraform Blue-Green Deployment with AWS Elastic Beanstalk

In this hands on exercise,  I worked on implementing a Blue-Green deployment strategy using Terraform and AWS Elastic Beanstalk.
The goal was to understand how we can deploy a new application version alongside the existing production version, validate it, and then switch production traffic to the new environment with minimal disruption.

🏗️ Architecture:
I created two separate Elastic Beanstalk environments:
🔵 Blue: Production
🟢 Green: Staging/Pre-production

The project includes:
- AWS Elastic Beanstalk Application
- Blue and Green Elastic Beanstalk environments
- Application Version 1.0 and Version 2.0
- Amazon S3 for storing application version packages
- IAM roles and instance profile
- Application Load Balancer
- Auto Scaling configuration
- Enhanced health reporting
- Environment variables to identify application versions
- Terraform outputs for environment information
- PowerShell automation for the environment swap

Both environments use a load-balanced Elastic Beanstalk configuration with Auto Scaling between 1 and 2 instances.

🔵🟢 How the Blue-Green deployment works
The initial state: Users -->🔵Blue Environment Production v1.0
I then deployed the new application version separately: 
Users -->🔵Blue Environment Production v1.0, and
🟢Green Environment Staging v2.0

The Green environment can be validated independently before promoting it to production.
Once the new version is ready, the deployment process swaps the CNAMEs of the two environments:
Before: Production CNAME --> 🔵 Blue --> v1.0 
After: Production CNAME--> 🟢 Green --> v2.0

I automated this swap using the AWS Elastic Beanstalk swap-environment-cnames operation through a PowerShell script.

🧠 What I learned
This project helped me understand an important distinction between deploying a new version and switching production traffic to a new environment.
I also gained practical experience with:
- Terraform resource dependencies
- AWS Elastic Beanstalk environments and application versions
- S3 application version storage
- IAM roles and instance profiles
- Load-balanced Elastic Beanstalk environments
- Auto Scaling configuration
- Health checks and enhanced health reporting
- Terraform outputs
- AWS CLI integration with Terraform workflows
- Automating deployment operations with PowerShell
- Blue-Green deployment and rollback concepts

One of my biggest takeaways:
- Blue-Green deployment separates application deployment from production traffic switching.
- The new version can be running in a separate environment before it becomes the production environment. This makes validation and rollback much easier to reason about.
- This project also reinforced something I've been learning throughout the Terraform challenge:
