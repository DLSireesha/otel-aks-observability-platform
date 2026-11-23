# OTEL AKS Observability Platform

An end-to-end cloud-native observability project deployed on **Azure Kubernetes Service (AKS)**. This project combines infrastructure automation, container orchestration, OpenTelemetry-based telemetry collection, and centralized monitoring using Datadog and Dynatrace.

---

## 📌 Project Overview

This project demonstrates deploying a multi-service application on Azure Kubernetes Service and implementing observability using OpenTelemetry.

Terraform is used to provision Azure infrastructure, including networking, AKS, and Azure Container Registry (ACR). Kubernetes manages application workloads, while OpenTelemetry Collector collects, processes, and exports application metrics and logs to Datadog and Dynatrace.

The project also includes a GitHub Actions CI workflow for application builds, testing, code quality checks, and Docker image builds.

---

## 🏗️ Architecture

```text
                    Developer
                        |
                        v
                 GitHub Repository
                        |
                        v
                  GitHub Actions
                   (CI Workflow)
                        |
                        v
                   Docker Build
                        |
                        v
             Azure Container Registry
                        |
                        v
       +----------------------------------+
       |       Azure Infrastructure      |
       |                                  |
       |           Terraform              |
       |               |                  |
       |               v                  |
       |      Azure Virtual Network      |
       |               |                  |
       |               v                  |
       |        Azure AKS Cluster         |
       |               |                  |
       |               v                  |
       |     Kubernetes Microservices    |
       |               |                  |
       |               v                  |
       |    OpenTelemetry Collector      |
       +---------------|------------------+
                       |
                 +-----+-----+
                 |           |
                 v           v
              Datadog     Dynatrace
              Metrics     Metrics
              and Logs    and Logs
```

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft Azure | Cloud infrastructure |
| Azure Kubernetes Service (AKS) | Managed Kubernetes platform |
| Azure Container Registry (ACR) | Container image registry |
| Terraform | Infrastructure as Code |
| Docker | Application containerization |
| Kubernetes | Container orchestration |
| OpenTelemetry | Telemetry collection and processing |
| Datadog | Metrics and log monitoring |
| Dynatrace | Observability and monitoring |
| GitHub Actions | CI workflow automation |
| Linux | Command-line operations and troubleshooting |

---

## ⚙️ Key Implementations

### 1. Azure Infrastructure Provisioning with Terraform

Automated Azure infrastructure provisioning using Terraform.

Infrastructure components include:

- Azure Resource Group
- Azure Virtual Network
- Public and private subnets
- Network Security Groups
- NAT Gateway
- Route Tables
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Managed Identity configuration
- AKS-to-ACR image-pull permissions

### 2. Application Deployment on AKS

Deployed the multi-service OpenTelemetry Demo application on Azure Kubernetes Service.

Implementation includes:

- Deploying containerized microservices using Kubernetes manifests.
- Managing Kubernetes Deployments, Services, Pods, and Namespaces.
- Configuring application connectivity with supporting services.
- Validating pod health and application availability.
- Troubleshooting Kubernetes workload failures and CrashLoopBackOff issues.

### 3. OpenTelemetry-Based Observability

Configured OpenTelemetry Collector to receive, process, and export application telemetry.

Observability implementation includes:

- Collecting application metrics and logs.
- Configuring OpenTelemetry receivers and processors.
- Exporting telemetry data to Datadog.
- Exporting telemetry data to Dynatrace.
- Troubleshooting telemetry collection and exporter configurations.

### 4. CI Workflow with GitHub Actions

Implemented a GitHub Actions CI workflow covering:

- Go dependency installation.
- Application compilation and build.
- Unit testing.
- Code quality checks using golangci-lint.
- Docker image building using Docker Buildx.

**Note:** The current workflow builds Docker images without automatically pushing them to ACR or deploying them to AKS.

---

## 🚀 Deployment and Validation

The application is deployed on Azure Kubernetes Service.

### Prerequisites

- Azure subscription
- Azure CLI
- Terraform
- Docker
- kubectl
- Git

### 1. Clone the Repository

```bash
git clone https://github.com/DLSireesha/otel-aks-observability-platform.git

cd otel-aks-observability-platform
```

### 2. Authenticate with Azure

```bash
az login
```

### 3. Connect to AKS

```bash
az aks get-credentials \
  --resource-group <resource-group-name> \
  --name <aks-cluster-name>
```

### 4. Verify Kubernetes Nodes

```bash
kubectl get nodes
```

### 5. Verify Application Pods

```bash
kubectl get pods -n otel-app
```

### 6. Verify Kubernetes Services

```bash
kubectl get services -n otel-app
```

### 7. Inspect Application Logs

```bash
kubectl logs <pod-name> -n otel-app
```

### 8. Inspect Pod Events

```bash
kubectl describe pod <pod-name> -n otel-app
```

---

## 📸 Screenshots and Project Evidence

Screenshots from the actual Azure deployment and monitoring environment will be included here.

### Resource Group

![Resource Group]("docs/images/Resource%20Group.png")

### Kubernetes Workloads

![AKS Running Pods]("docs/images/Pods_Status.png")

![AKS Services]("docs/images/Services.png")

### Dynatrace Monitoring

![Dynatrace Services]("docs/images/Dynatrace%20Services.png")

### Datadog Monitoring

![Datadog Logas]("docs/images/Dynatrace%20Logs.png")

---

## 📂 Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── ci.yaml
├── docker-compose.yml
├── kubernetes/
├── src/
├── terraform/
│   ├── backend/
│   ├── modules/
│   │   ├── ACR/
│   │   ├── AKS/
│   │   └── Vnet/
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
└── README.md
```

---

## 🔍 Troubleshooting Experience

During development and deployment, the following troubleshooting activities were performed:

- Investigated Kubernetes CrashLoopBackOff errors.
- Inspected pod logs and Kubernetes events.
- Troubleshot application startup and configuration issues.
- Validated pod health and service connectivity.
- Reviewed OpenTelemetry Collector configuration.
- Troubleshot telemetry collection and exporter configurations.

---

## 🎯 Skills Demonstrated

- Azure cloud infrastructure provisioning.
- Infrastructure as Code using Terraform.
- Kubernetes application deployment and troubleshooting.
- Docker containerization.
- OpenTelemetry configuration and telemetry pipelines.
- Metrics and log monitoring using Datadog and Dynatrace.
- CI workflow automation using GitHub Actions.
- Linux administration and command-line troubleshooting.

---

## 🔮 Future Enhancements

- Automate Docker image publishing to Azure Container Registry.
- Implement continuous deployment to AKS.
- Extend CI/CD with automated deployment validation.
- Enhance observability dashboards and alerting.
- Implement additional Kubernetes reliability and scaling practices.

---

## 👩‍💻 Author

**Sireesha**


- **GitHub:** [DLSireesha](https://github.com/DLSireesha)
- **Project Repository:** [OTEL AKS  Observability Platform](https://github.com/DLSireesha/otel-aks-observability-platform)
