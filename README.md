# AWS EKS Platform Engineering

Production-grade cloud-native platform on AWS demonstrating modern Platform Engineering practices using Terraform, Kubernetes, GitOps, Observability, and Progressive Delivery.

---

## Architecture Overview

This project provisions and operates a production-style Kubernetes platform on AWS using Amazon EKS and supporting platform services.

The platform focuses on:

* Infrastructure as Code (Terraform)
* Kubernetes Platform Engineering
* GitOps and Continuous Delivery
* Secure Secrets Management
* Cloud-Native Observability
* Progressive Delivery Strategies

---

## Technology Stack

### Cloud Platform

* Amazon Web Services (AWS)
* Amazon EKS
* Amazon VPC
* IAM Roles and Pod Identity
* Amazon Route53
* AWS Certificate Manager (ACM)
* AWS Secrets Manager
* Amazon RDS MySQL

### Infrastructure as Code

* Terraform
* Modular Terraform Design
* Remote State Backend (S3)

### Container Platform

* Docker
* Kubernetes
* Helm

### Platform Add-ons

* AWS Load Balancer Controller
* Amazon EBS CSI Driver
* Secrets Store CSI Driver
* ExternalDNS

### GitOps & Delivery

* ArgoCD
* Argo Rollouts
* Blue/Green Deployments
* Canary Deployments

### Observability

* OpenTelemetry
* Prometheus
* Grafana

---

## Repository Structure

```text
aws-eks-platform-engineering/

├── docker/
├── terraform-backend/
├── eks-platform/
│   ├── vpc/
│   ├── cluster/
│   └── addons/
│       ├── alb-controller/
│       ├── ebs-csi/
│       ├── secrets-store-csi/
│       └── external-dns/
├── microservices/
├── helm/
├── argocd/
├── observability/
├── rollouts/
├── docs/
└── README.md
```

---

## Platform Features

### Infrastructure Platform

* Provisioned Amazon VPC and networking components
* Deployed Amazon EKS cluster using Terraform
* Implemented modular Infrastructure as Code
* Configured remote Terraform state management

### Security & Secrets Management

* Implemented EKS Pod Identity
* Integrated AWS Secrets Manager
* Configured Secrets Store CSI Driver
* Mounted application secrets securely inside Kubernetes workloads

### Storage Platform

* Installed Amazon EBS CSI Driver
* Configured persistent storage for Kubernetes applications

### Networking Platform

* Installed AWS Load Balancer Controller
* Configured Application Load Balancer (ALB) Ingress
* Automated DNS management using ExternalDNS
* Implemented HTTPS using ACM certificates

### Application Platform

* Containerized microservices using Docker
* Deployed applications to Amazon EKS
* Integrated Amazon RDS MySQL using Kubernetes ExternalName services

### GitOps Platform *(In Progress)*

* ArgoCD installation and configuration
* Declarative application deployments
* Git-driven Kubernetes delivery workflows

### Observability Platform *(In Progress)*

* OpenTelemetry instrumentation
* Prometheus metrics collection
* Grafana dashboards and visualization
* Kubernetes and application monitoring

### Progressive Delivery Platform *(In Progress)*

* Argo Rollouts installation
* Blue/Green deployments
* Canary deployments
* Automated rollback strategies
* Traffic shifting and release validation

---

## Learning Objectives

This project demonstrates practical experience with:

* Platform Engineering
* Cloud-Native Architecture
* Kubernetes Administration
* Infrastructure as Code
* GitOps Workflows
* Production Observability
* Secure Secret Management
* Progressive Delivery Strategies
* AWS Managed Services Integration

---

## Future Enhancements

* Complete Helm-based application packaging
* Implement ArgoCD ApplicationSets
* Build Grafana dashboards for platform metrics
* Configure distributed tracing with OpenTelemetry
* Implement Argo Rollouts Analysis Templates
* Integrate automated deployment verification
* Expand platform monitoring and alerting

---

## Author

Built as a hands-on Platform Engineering project to demonstrate production-grade AWS, Kubernetes, GitOps, Observability, and Progressive Delivery practices.
