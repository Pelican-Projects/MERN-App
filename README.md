# MERN Stack Application with Kubernetes, Terraform, and Ansible.

This project is a simple MERN stack application, and this project is based on [https://github.com/iam-veeramalla/MERN-docker-compose]
  
I forked and enhanced it by adding:

- **Containerization** of frontend, backend, and MongoDB services using Docker.
- **Deployment on Google Kubernetes Engine (GKE)** for scalable orchestration.
- **Infrastructure provisioning with Terraform** to manage GCP resources declaratively.
- **Automation of deployment workflows using Ansible**, including Kubernetes context setup and resource application.
- **CI/CD pipelines configured with GitHub Actions** to automate build, test, and deployment processes.
- **Kubernetes manifests** split into logical directories for frontend, backend, and database with best practices.
- Use of **Kubernetes Secrets and ConfigMaps** to securely manage sensitive information and configuration.
- Optional **Ingress configuration** for external access without a domain name, using LoadBalancer services."
