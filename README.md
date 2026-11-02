
# CloudPilot – Multi-Cloud DevOps Automation Platform

CloudPilot is a hands-on Multi-Cloud DevOps project that demonstrates how to build, containerize, automate, and deploy a web application using AWS and Google Cloud Platform (GCP).

The project uses Terraform for Infrastructure as Code, Docker for containerization, and GitHub Actions for CI/CD automation.

It includes automated Docker image publishing to Docker Hub and static website deployment to Amazon S3.

## Project Goals

- Build a responsive web dashboard using HTML, CSS, and JavaScript.
- Containerize the application using Docker.
- Automate Docker image builds and publishing using GitHub Actions.
- Provision AWS and GCP infrastructure using Terraform.
- Deploy the website to Amazon S3 using GitHub Actions and AWS OIDC authentication.
- Demonstrate practical multi-cloud DevOps skills.



## Technology Stack

| Category | Technologies |
|---|---|
| Frontend | HTML, CSS, JavaScript |
| Containerization | Docker, Nginx |
| CI/CD | GitHub Actions |
| Container Registry | Docker Hub |
| Infrastructure as Code | Terraform |
| Cloud Platform 1 | Amazon Web Services (AWS) |
| Cloud Platform 2 | Google Cloud Platform (GCP) |
| Static Website Hosting | Amazon S3 |
| Version Control | Git, GitHub |
| Development Environment | VS Code, macOS |



## Project Architecture

CloudPilot uses a multi-cloud architecture with AWS and Google Cloud Platform.

### Application Workflow

1. Developer pushes application code to GitHub.
2. GitHub Actions automatically builds and tests the Docker image.
3. The Docker image is published to Docker Hub.
4. Terraform provisions infrastructure on AWS and GCP.
5. The application runs inside Docker containers on AWS EC2 and GCP Compute Engine.
6. GitHub Actions deploys the static website files to Amazon S3.

### Deployment Components

- **GitHub:** Stores application source code and Terraform configurations.
- **GitHub Actions:** Automates Docker image publishing and S3 website deployment.
- **Docker Hub:** Stores the CloudPilot Docker image.
- **AWS EC2:** Runs the containerized application.
- **GCP Compute Engine:** Runs the containerized application.
- **Amazon S3:** Hosts the static CloudPilot website.
- **Terraform:** Provisions cloud infrastructure.



## Run CloudPilot Locally

### Prerequisites

Install the following tools:

- Git
- Docker Desktop
- VS Code (optional)

### 1. Clone the repository

```bash
git clone https://github.com/prameelarani07/multicloud-devops.git
```

### 2. Navigate to the project directory

```bash
cd multicloud-devops
```

### 3. Build the Docker image

```bash
docker build -t cloudpilot:1.0 .
```

### 4. Run the Docker container

```bash
docker run -d --name cloudpilot-container -p 8080:80 cloudpilot:1.0
```

### 5. Open the application

Open your browser and visit:

http://localhost:8080

### 6. Stop the container

```bash
docker stop cloudpilot-container
```

### 7. Remove the container

```bash
docker rm cloudpilot-container
```



## CI/CD Automation

CloudPilot uses GitHub Actions to automate application delivery.

### 1. Docker CI/CD Pipeline

Workflow file: `.github/workflows/docker-publish.yml`

When code is pushed to the configured branch:

1. GitHub Actions checks out the repository.
2. Builds the Docker image.
3. Tests the application.
4. Builds a multi-platform Docker image.
5. Pushes the image to Docker Hub.

Docker Hub repository:

`prameelarani0712/cloudpilot`

### 2. AWS S3 Deployment Pipeline

Workflow file: `.github/workflows/deploy-s3.yml`

When website files are updated and pushed to the `main` branch:

1. GitHub Actions checks out the repository.
2. Authenticates with AWS using OpenID Connect (OIDC).
3. Uploads `index.html` to Amazon S3.
4. Synchronizes website assets with the S3 bucket.

AWS authentication uses an IAM role instead of storing long-lived AWS access keys in GitHub Secrets.

### Pipeline Status

Both GitHub Actions workflows have been executed successfully.



## Infrastructure as Code (Terraform)

CloudPilot uses Terraform to provision cloud resources.

### AWS Infrastructure

Configuration directory: `terraform/aws/`

Resources created:

- Amazon EC2 instance
- Security group for HTTP traffic
- Docker-based application deployment

AWS region: `ap-south-1`

### GCP Infrastructure

Configuration directory: `terraform/gcp/`

Resources created:

- Google Compute Engine virtual machine
- Firewall rule for HTTP traffic
- Docker-based application deployment

GCP region: `us-central1`

### AWS S3 Website Hosting

Configuration directory: `terraform/aws-s3/`

Resources created:

- S3 bucket for static website hosting
- Static website configuration
- Public-read bucket policy
- Website file and asset uploads

### Terraform Commands

Run these commands from the relevant Terraform configuration directory:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

To remove resources managed by a Terraform configuration:

```bash
terraform destroy
```

**Note:** Review the Terraform plan and estimated cloud costs before applying changes. Some cloud resources may incur charges even when virtual machines are stopped.



## Project Structure

```text
multicloud-devops/
│
├── index.html
├── README.md
├── assets/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   └── script.js
│   └── images/
│
├── Dockerfile
│
├── .github/
│   └── workflows/
│       ├── docker-publish.yml
│       └── deploy-s3.yml
│
└── terraform/
    ├── aws/
    ├── gcp/
    └── aws-s3/
```



## Project Status

| Component | Status |
|---|---|
| CloudPilot Web Dashboard | Completed |
| Docker Containerization | Completed |
| Docker Hub Image Publishing | Completed |
| GitHub Actions Docker Pipeline | Successful |
| AWS EC2 Deployment | Completed |
| GCP Compute Engine Deployment | Completed |
| AWS S3 Static Website Hosting | Completed |
| GitHub Actions S3 Deployment | Successful |
| Terraform Infrastructure | Completed |

### Important Notes

- AWS EC2 and GCP Compute Engine instances were stopped after successful deployment to help control costs.
- The Amazon S3 static website remains hosted separately.
- Cloud resources may incur charges even when virtual machines are stopped.
- Never commit cloud credentials, access keys, passwords, or Terraform state files to GitHub.

## Author

**Prameela Rani**

GitHub: [prameelarani07](https://github.com/prameelarani07)

---

*CloudPilot – Building and automating multi-cloud infrastructure through DevOps practices.*
