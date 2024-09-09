# Saleor Platform Deployment on Google Kubernetes Engine (GKE)

This repository offers comprehensive configuration files and deployment guidelines for running the Saleor platform on Google Kubernetes Engine (GKE). The setup integrates multiple core services, such as the API, Storefront, Dashboard, PostgreSQL database, and Redis caching system, ensuring a robust and scalable deploymen

## Preview
This setup deploys the Saleor platform on GKE using Kubernetes, harnessing cloud-native technologies for scalability, reliability, and streamlined management. The deployment includes the following key services:

Saleor API: Powers the backend of the Saleor platform.
Jaeger: Default frontend for the e-commerce site.
Saleor Dashboard: Administrative interface for platform management.
PostgreSQL: Managed database solution for persistent data storage.
Redis: In-memory store for caching and message brokering, enhancing performance and efficiency.


## Overall Setup

1. Clone the Repository

```bash
git clone https://github.com/imbikrammalla/saleor-platform.git
cd saleor-platform

```
2. Create GKE Cluster

```bash
gcloud container clusters create-auto saleor-cluster \
--location=us-central1

```

3.Get authentication credentials for the cluster

```bash 
gcloud container clusters get-credentials saleor-cluster \
--location us-central1
```

## Deployment

- **Deploy Saleor Services,Postgres and Redis**
```bash
kubectl apply -f deployment.yaml
kubectl apply -f redis_postgres.yaml
```

## Usage

```python
kubectl get services
```

### Access the services

- **Saleor Dashboard**: <http://34.44.200.83/9002>
- **Saleor API**: <http://35.193.247.113/8000>
- **Jaeger**: <http://104.198.178.234//16686>
- **Postgres**: <34.118.226.210>
- **Redis**: <34.118.238.48>

## Troubleshooting

- **Check Pod and Service Status**
```bash
kubectl get pods -n saleor
kubectl get services -n saleor
```
- **Check logs of pods**
```bash
kubectl logs <pod-name> -n saleor

```

## Scan Vulnerability

```bash
trivy image <your image to be scanned>
```

