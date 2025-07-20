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

##### Install Node.js and Angular CLI

```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g @angular/cli
```

##### Install Nginx

```
sudo apt update
sudo apt install nginx
```

## Create EKS cluster

```
git clone https://github.com/jeromebrasseur/deploy-eks-using-terraform.git
cd deploy-eks-using-terraform
terraform init
terraform plan
terraform apply
```
