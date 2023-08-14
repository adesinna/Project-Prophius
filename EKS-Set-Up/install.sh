#!/bin/bash
# Install AWS CLI
sudo apt-get update -y
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure AWS CLI
read -p "Enter your AWS Access Key ID: " aws_access_key_id
read -p "Enter your AWS Secret Access Key: " aws_secret_access_key

aws configure set aws_access_key_id "$aws_access_key_id"
aws configure set aws_secret_access_key "$aws_secret_access_key"
aws configure set default.region us-west-1
aws configure set default.output_format json


# Check if the system architecture is ARM64
if [[ $(arch) != "aarch64" ]]; then
    echo "This script is intended for ARM64 architecture only."
    exit 1
fi

# Install dependencies
sudo apt-get update
sudo apt-get install -y unzip

# Download Terraform for ARM64
TERRAFORM_VERSION="0.14.7"  # Change to the desired version
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip"
wget ${TERRAFORM_URL} -O /tmp/terraform.zip

# Unzip and move Terraform binary to /usr/local/bin
sudo unzip /tmp/terraform.zip -d /usr/local/bin/

# Clean up
sudo rm /tmp/terraform.zip

# Verify installation
terraform version

echo "Terraform installation completed."

