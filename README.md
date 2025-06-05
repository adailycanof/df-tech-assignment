# df-tech-assignment

A comprehensive technical assignment showcasing AWS infrastructure design, Terraform infrastructure as code, and containerized application development.

## Project Overview

This project demonstrates a full-stack technical solution including:

- **AWS Architecture Design**: Comprehensive documentation of a monolithic .NET Framework web application deployment on AWS
- **Infrastructure as Code**: Terraform configurations for AWS S3 bucket provisioning with LocalStack integration
- **Containerized Application**: A simple Node.js Express application with Docker containerization

## Project Structure

```
df-tech-assignment/
├── architecture_design/
│   ├── README.md          # Detailed AWS architecture documentation
│   └── image.png          # Architecture diagram
├── infrastructure-provisioning/
│   ├── providers.tf       # AWS provider configuration for LocalStack
│   ├── versions.tf        # Terraform version constraints
│   ├── s3-dave.tf        # Dave bucket configuration
│   ├── s3-wizard.tf      # Wizards bucket with versioning
│   ├── s3-cloudfront-logs.tf # CloudFront logs bucket
│   └── outputs.tf        # Terraform outputs
└── simple-app-docker/
    ├── Dockerfile        # Multi-stage Docker build
    ├── package.json      # Node.js dependencies
    └── server.js         # Express.js application
```

## Architecture Design

The `architecture_design/` directory contains comprehensive documentation for a production-ready AWS architecture featuring:

### Key Components
- **Multi-AZ deployment** across two availability zones for high availability
- **Load balancing** with Application Load Balancer
- **Auto scaling** capabilities for handling traffic fluctuations
- **Database layer** with RDS SQL Server and read replicas
- **Caching layer** using ElastiCache Redis
- **CDN and security** with CloudFront and AWS WAF

### Security Features
- VPC with public/private subnets
- Security groups and NACLs
- Encryption at rest and in transit
- IAM roles with least privilege access
- Secrets Manager for credential management

## Infrastructure Provisioning

The Terraform configuration in `infrastructure-provisioning/` demonstrates:

### Features
- **LocalStack integration** for local AWS development
- **Three S3 buckets** with different configurations:
  - `dave`: General storage bucket
  - `wizards`: Version-controlled storage bucket
  - `cloudfront-logs`: CloudFront access logs with lifecycle policies
- **Security configurations** including public access blocking
- **Lifecycle management** for cost optimization

### Prerequisites
- Terraform >= 1.5.7
- LocalStack running on `localhost:4566`
- AWS CLI configured (for LocalStack)

### Usage
```bash
cd infrastructure-provisioning/
terraform init
terraform plan
terraform apply
```

## Simple Docker Application

The `simple-app-docker/` directory contains a lightweight Node.js application showcasing:

### Features
- **Express.js** web server with multiple endpoints
- **Health check** endpoint for monitoring
- **API endpoints** for demonstration
- **Security best practices** with non-root user
- **Production-ready** Docker configuration

### Endpoints
- `GET /` - Welcome message with timestamp
- `GET /health` - Health check endpoint
- `GET /api/info` - Application and system information
- `POST /api/echo` - Echo service for testing

### Running the Application

#### Local Development
```bash
cd simple-app-docker/
npm install
npm start
```

#### Docker Deployment
```bash
cd simple-app-docker/
docker build -t sample-node-app .
docker run -p 3000:3000 sample-node-app
```

Access the application at `http://localhost:3000`

## Technical Stack

- **Infrastructure**: AWS, Terraform, LocalStack
- **Application**: Node.js, Express.js
- **Containerization**: Docker
- **Architecture**: Multi-tier, microservices-ready

## Key Highlights

### Infrastructure as Code
- Modular Terraform configuration
- LocalStack integration for local development
- Production-ready AWS resource configurations

### Security Best Practices
- Non-root container execution
- Secure S3 bucket policies
- Network isolation and encryption

### Operational Excellence
- Health check endpoints
- Graceful shutdown handling
- Comprehensive logging and monitoring setup

## Getting Started

1. **Review the architecture**: Start with `architecture_design/README.md`
2. **Set up infrastructure**: Use the Terraform configurations in `infrastructure-provisioning/`
3. **Run the application**: Deploy the Docker application from `simple-app-docker/`