🚀 **Day 7 of #30daysofawsterraform – Terraform Type Constraints**

Today I explored **Terraform Type Constraints**, which help ensure variables follow a defined structure and prevent configuration errors.

Type constraints make Terraform configurations **more predictable, safer, and easier to maintain**, especially in larger infrastructure projects.

### Terraform Variable Types I Practiced

🔹 **String**
Used for simple values like regions or names.

```hcl
variable "region" {
  type = string
}
```

---

🔹 **Number**
Useful when defining quantities such as the number of resources to create.

```hcl
variable "instance_count" {
  type = number
}
```

---

🔹 **Boolean**
Controls feature toggles such as enabling monitoring.

```hcl
variable "monitoring_enabled" {
  type = bool
}
```

---

🔹 **List**
An ordered collection of values.

Example: list of instance types.

```hcl
variable "allowed_instance_type" {
  type = list(string)
}
```

---

🔹 **Set**
Similar to a list but does not allow duplicate values.

Example: allowed AWS regions.

---

🔹 **Map**
Stores key-value pairs, commonly used for tags.

```hcl
variable "tags" {
  type = map(string)
}
```

---

🔹 **Tuple**
A fixed structure containing values of different types.

Example used for defining security group rules.

---

🔹 **Object**
A complex structure that groups multiple attributes together.

Example configuration object:

```hcl
variable "config_type_object" {
  type = object({
    region              = string
    monitoring_enabled  = bool
    number_of_instances = number
  })
}
```

---

### What I Built

Using these type constraints I created:

• EC2 instances with configurable instance counts
• Security groups with tuple-based rule definitions
• Tagged resources using map variables
• Config objects controlling infrastructure parameters

---

### Key Takeaway

Terraform type constraints make infrastructure code **safer and easier to scale**, because they enforce the structure of configuration values before resources are created.

Learning how to properly use lists, maps, sets, tuples, and objects makes Terraform configurations much more powerful and reusable.

Looking forward to continuing the challenge.

#terraform #aws #devops #cloudcomputing #iac #learninginpublic #30daysofawsterraform
