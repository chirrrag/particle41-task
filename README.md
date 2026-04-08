```markdown
# 🚀 Simple Time Service - End-to-End DevOps Implementation

This repository demonstrates a complete **end-to-end DevOps lifecycle** for deploying a containerized application on **AWS EKS** using modern DevOps tools and best practices.

It covers:
- Application containerization using Docker
- Infrastructure provisioning using Terraform
- Kubernetes deployment on EKS
- CI/CD automation using GitLab pipelines

---

## 📁 Repository Structure

```

.
├── app/               # Application code + Dockerfile
├── terraform/         # Infrastructure as Code (AWS resources)
├── kubernetes/        # Kubernetes manifests
├── template/          # GitLab CI reusable templates
├── .gitlab-ci.yml     # Main CI/CD pipeline

```

---

## 🧩 Components Overview

### 📦 Application (`app/`)
- Contains the **simple-time-service** application
- Includes a Dockerfile for building the container image
- Public Docker image available at:

```

docker pull sapraji/simple-time-service:latest

```

---

### ☁️ Infrastructure (`terraform/`)
Terraform is used to provision complete AWS infrastructure:

- VPC (Virtual Private Cloud)
- Internet Gateway (IGW)
- NAT Gateway
- Public & Private Subnets
- EKS Cluster
- Managed Node Groups

This ensures a **scalable and production-ready Kubernetes environment**.

---

### ☸️ Kubernetes (`kubernetes/`)
Contains all Kubernetes resources required to deploy and run the application:

- Deployment
- Service (ClusterIP)
- ALB Ingress (AWS Load Balancer Controller)
- Horizontal Pod Autoscaler (HPA)
- Fluent Bit DaemonSet (for logging)

---

### 🔁 GitLab CI/CD (`.gitlab-ci.yml`)

Implements a full **Software Development Lifecycle (SDLC)** pipeline.

---

## ⚙️ Pipeline Stages

```

stages:

* build
* terraform-plan
* terraform-deploy
* kubernetes-deploy

````

---

## 🔨 Build Stage

- Uses **Kaniko** to build Docker images (no Docker daemon required)
- Pushes images to container registry
- Dynamically determines environment:

| Condition | Environment |
|----------|------------|
| Merge Request | QA |
| main/master branch | Production |
| Other branches | Dev |

---

## 📐 Terraform Plan

- Initializes Terraform
- Validates infrastructure changes using:
  ```bash
  terraform init
  terraform plan
````

---

## 🚀 Terraform Deploy

* Manual approval step for production
* Applies infrastructure changes:

  ```bash
  terraform apply -auto-approve
  ```

---

## ☸️ Kubernetes Deploy

* Configures kubeconfig using AWS CLI
* Deploys all Kubernetes manifests:

```bash
kubectl apply -f .
```

---

## 🧪 GitLab CI Template (`template/`)

* Contains reusable pipeline templates
* Helps standardize CI/CD workflows across projects
* Enables modular and scalable pipeline design

---

## 🐳 Docker Image

Public Docker image:

```
sapraji/simple-time-service:latest
```

---

## 🚀 Deployment Flow

1. Developer pushes code or creates a merge request
2. Pipeline triggers automatically:

   * Builds Docker image
   * Runs Terraform plan
3. Manual approval steps:

   * Terraform apply
   * Kubernetes deployment
4. Application gets deployed on EKS
5. Exposed via **AWS ALB Ingress**

---

## 📊 Observability & Logging

* **Fluent Bit DaemonSet** for log collection
* Prometheus annotations enabled in deployment for metrics scraping

---

## ⚡ Prerequisites

Before running this project, ensure:

* AWS CLI configured with proper IAM permissions
* Terraform installed (for local testing)
* kubectl installed
* Access to AWS EKS cluster
* GitLab Runner (ARM-based for Kaniko builds)

---

## 🔐 IAM Permissions Required

* ECR access (push/pull images)
* EKS access
* EC2 / VPC provisioning permissions
* IAM role management (for EKS)

---

## 🔥 Future Enhancements

* Helm chart packaging
* ArgoCD (GitOps-based deployment)
* Blue-Green / Canary deployments
* Prometheus + Grafana monitoring stack
* AWS WAF integration with ALB
* Automated rollback strategies

---

## 👨‍💻 Author

**Chirag Sapra**
DevOps Engineer
Expertise: AWS | Kubernetes | Terraform | CI/CD

---

## 📌 Summary

This project demonstrates:

* Complete DevOps lifecycle automation
* Infrastructure + application deployment
* Scalable and production-ready architecture
* CI/CD best practices using GitLab
