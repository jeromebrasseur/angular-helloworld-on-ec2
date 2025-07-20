# Deploy Angular HelloWorld on EC2 instance

<p align="center"><img src="img/EKS-Terraform.jpg" width="50%"></p>

----

This repo provides the steps to deploy Angular HelloWorld on EC2 instance using Jenkins. Jenkins is an open-source automation server tool. It helps automate the build, testing, and deployment aspects of software development, and facilitates continuous integration and continuous delivery.

----

## Prerequisites

##### Install Jenkins

```
nano install_jenkins.sh
# collez le script, puis Ctrl+O, Entrée, Ctrl+X

chmod +x install_jenkins.sh

./install_jenkins.sh
```

##### Install Terraform

```
TF_VERSION=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].version' | grep -v 'rc|beta|alpha' | tail -1)

curl -LO "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
unzip terraform_${TF_VERSION}_linux_amd64.zip
sudo mv -f terraform /usr/local/bin/
rm terraform_${TF_VERSION}_linux_amd64.zip
```

##### Connect Terraform with AWS

```
aws configure
```

## Create EKS cluster

```
git clone https://github.com/jeromebrasseur/deploy-eks-using-terraform.git
cd deploy-eks-using-terraform
terraform init
terraform plan
terraform apply
```
