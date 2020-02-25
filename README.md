# DevOps-DB-Wrangling: Migrating a burdensome database to resilient cloud native architecture
PostgreSQL migration to NewSQL containerized and multi-cluster CockroachDB StatefulSet orchestration. 

## Motivation
Choices of database architecture have historically relied on a narrow trade-off between availability and consistency. This project demonstrates the ability of new technologies to go beyond the exclusivity of the CAP theorem and showcase a range of benefits.  This project migrated from a large single node PostgreSQL database to CockroachDB deployed with Kubernetes on AWS with an autoscaled, stateful, and multi-clustered orchestration. The resulting database infrastructure shows benchmark improvements, high data availability, geographical & horizontal scalability, and the preservation of ACID dependent financial transactions. 

## Infrastructure 

 ![Project Infrastructure](/images/infrastructure.png)

## Instructions

### Install kubectl for command line k8s
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin
```

### Install Terraform and Spin Up Your Infrastructure on AWS
Download and run terraform binary [here](https://www.terraform.io/downloads.html). 
Then run

$`terraform init`
$`terraform apply`

### Configure kubectl
```
terraform output kubeconfig >> ~/.kube/config
aws eks --region us-east-1 update-kubeconfig --name terraform-eks-ccdb
```

## Next Steps: 
Install CockroachDB, Prometheus, K8s dashboard, and Gremlin for resilience testing as per developer documentation. 