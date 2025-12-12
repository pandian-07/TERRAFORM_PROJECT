# 🌍 Terraform Multi-Module AWS Project

This project is a **modular Terraform infrastructure setup** designed for AWS.
It follows a clean architecture with separate modules for:

* 💻 **EC2**
* 🔐 **IAM**
* 📦 **S3**
* 🌐 **VPC**
* 🏷 **Workspace-aware deployments**
* 🪣 **Remote backend (S3) + State Locking**

The goal is to make the infrastructure **reusable, scalable, and easy to automate** in CI/CD pipelines.

---

## 📁 Project Structure

```
TERRAFORM_PROJECT/
│
├── AWS/
│   ├── Ec2code/
│   │   ├── ec2code.tf
│   │   ├── output.tf
│   │
│   ├── Iamcode/
│   │   ├── iamcode.tf
│   │   ├── output.tf
│   │
│   ├── S3code/
│   │   ├── s3code.tf
│   │   ├── output.tf
│   │
│   ├── Vpccode/
│   │   ├── vpccode.tf
│   │   ├── output.tf
│   │
│   ├── workspace/
│   │   └── workspace.tf
│   │
│   ├── provider.tf
│   ├── module.tf
│   ├── output.tf
│   └── terraform.lock.hcl
│
└── README.md
```

---

## 🏗 What This Project Does

✔ Deploys AWS resources using separate Terraform modules
✔ Stores Terraform state securely in **S3 backend**
✔ Organizes code clearly for team collaboration
✔ Supports workspace-based environments (dev, qa, prod)
✔ Makes automation easier with GitLab/GitHub CI/CD

---

## ⚙️ Backend Configuration (S3 State Storage)

The `provider.tf` configures:

```hcl
terraform {
  backend "s3" {
    bucket = "terabackend123"
    key    = "statefile"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
```

This ensures:

* Your **state file is safe** ✔
* Multiple people can work without conflicts ✔
* Easy integration with pipelines ✔

---

## 🚀 How to Use

### **1️⃣ Initialize Terraform**

```
terraform init
```

This downloads providers, modules, and connects to the S3 backend.

---

### **2️⃣ Select or Create a Workspace**

```
terraform workspace new dev
terraform workspace select dev
```

Each environment will get its own isolated state.

---

### **3️⃣ Preview the Infrastructure**

```
terraform plan -out=myplan.tfplan
```

---

### **4️⃣ Apply the Infrastructure**

```
terraform apply myplan.tfplan
```

---

### **5️⃣ Destroy the Infrastructure**

```
terraform destroy
```

---

## 🧩 Modules Overview

| Module        | Purpose                                |
| ------------- | -------------------------------------- |
| **Ec2code**   | Launch EC2 instances                   |
| **Iamcode**   | Create IAM users/roles/policies        |
| **S3code**    | Manage S3 buckets                      |
| **Vpccode**   | Create VPC, subnets, IGW, route tables |
| **workspace** | Workspace-specific variables           |

Each module has its own `output.tf` for easy value sharing.

---

## 🧪 CI/CD Ready

This project works seamlessly with GitLab CI or GitHub Actions.

You can run:

* `terraform fmt` for formatting
* `terraform validate` for syntax checks
* `terraform plan` + artifact save
* `terraform apply` from pipeline

---

## 🧊 Why This Structure is Used

✔ Cleaner than a single `main.tf`
✔ Easy to maintain and scale
✔ Helps in real production projects
✔ Perfect for DevOps/SRE learning
✔ Makes you look professional in interviews

---

## 👨‍💻 Author

**M. Pandian**
Terraform • AWS • DevOps • Cloud Enthusiast ☁️

---
