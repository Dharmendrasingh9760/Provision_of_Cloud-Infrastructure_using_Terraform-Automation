# ☁️ Provision of Cloud-Infrastructure using Terraform-Automation


This project demonstrates how to provision a complete cloud infrastructure on AWS using **Terraform**, automating the deployment of core networking, compute, and storage components.

#

<img src="https://miro.medium.com/v2/resize:fit:1100/format:webp/1*jDszjdAzdqOgFyuQuYzC9w.png" alt="AWS Architecture" width="600"/>


## 🚀 Features

- ✅ VPC with Public Subnet, Internet Gateway, and Route Table
- 💻 EC2 Instance with Apache Web Server (configured using user-data)
- 🌐 Application Load Balancer (ALB) for distributing traffic
- 🪣 S3 Bucket for Static Website Hosting (with `index.html` and `error.html`)
- 📦 Fully Automated with Terraform (Infrastructure as Code)

#

## 🧰 Tech Stack

- **Cloud Provider:** AWS  
- **IaC Tool:** Terraform v1.12.2 
- **Web Server:** Apache (Installed via EC2 User Data Script)  
- **Storage:** S3 Bucket ( For Static Hosting)  
- **Load Balancer:** Application Load Balancer (ALB)

#

## 🎯 Project Goals

- Automate cloud infrastructure using **Infrastructure as Code (IaC)**
- Deploy a web application on an EC2 instance using Apache
- Configure an S3 bucket to serve static content
- Implement load balancing for better availability
- Demonstrate reusable and modular Terraform code

#

## 🛠️ How to Deploy

### ✅ Step 1: Clone the Repository
### ✅ Step 2: Initialize Terraform
### ✅ Step 3: Review the Execution Plan
### ✅ Step 4: Apply the Configuration

#

## 🌐 Access Your Resources
🔗 EC2 Website: http://ec2-public-ip

🔗 Load Balancer URL: http://alb-dns-name

🔗 S3 Website: http://s3-website-endpoint
