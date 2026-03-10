# Terraform Provider is a Plugin for the provider
a Terraform provider is a plugin, and the **provider** block is how you configure that specific plugin (e.g., for AWS) within your code.
Key Concepts

• Terraform Provider (the plugin): This is an executable binary (plugin) developed to understand the API interactions of a specific service, such as Amazon Web Services (AWS)
, Azure, or Google Cloud Platform. It translates the high-level Terraform configuration language into the specific API calls needed to create, manage, and destroy resources in that service.
• **provider** block (the configuration): This block in your Terraform configuration files (.tf) is where you specify the settings for the plugin you want to use. This includes essential configuration details like:

    • The region (e.g., us-eat-1 for AWS).
    • Authentication credentials (though environment variables or IAM roles are generally recommended for security).
    • An **alias** if you need to use multiple configurations for the same provider within one project (e.g., managing resources across two different AWS regions).

In short, the block tells Terraform how to use the installed provider plugin to interact with the external service's API.

25:25 Gave AmazonS3FullAccess as permissions for the IAM user
