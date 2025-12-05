#!/bin/bash

# Backblaze B2 Infrastructure as Code - Deployment Script
echo "🏗️  Deploying Infrastructure to Backblaze B2"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if config file exists
check_config() {
    if [ ! -f "terraform/config.auto.tfvars" ]; then
        print_error "Configuration file not found: terraform/config.auto.tfvars"
        echo "Please run ./scripts/setup.sh first and add your B2 credentials"
        exit 1
    fi
}

# Terraform plan
terraform_plan() {
    print_status "Creating execution plan..."
    cd terraform
    terraform plan -out=plan.out
    cd ..
}

# Terraform apply
terraform_apply() {
    print_status "Applying infrastructure changes..."
    cd terraform
    terraform apply -auto-approve plan.out
    cd ..
}

# Get deployment outputs
get_outputs() {
    print_status "Retrieving deployment outputs..."
    cd terraform
    WEBSITE_URL=$(terraform output -raw website_url)
    BUCKET_NAME=$(terraform output -raw bucket_name)
    cd ..
    
    echo ""
    print_status "🎉 Deployment Successful!"
    echo ""
    echo "📊 Deployment Summary:"
    echo "   Website URL: $WEBSITE_URL"
    echo "   Bucket Name: $BUCKET_NAME"
    echo ""
    echo "🌐 Your website is now live at: $WEBSITE_URL"
    echo ""
    echo "Next steps:"
    echo "1. Visit your website: $WEBSITE_URL"
    echo "2. Check docs/DEPLOYMENT.md for more information"
    echo "3. To make changes, update the Terraform files and re-run this script"
}

# Main deployment process
main() {
    echo "=================================================="
    echo "   Backblaze B2 Infrastructure Deployment"
    echo "=================================================="
    
    check_config
    terraform_plan
    terraform_apply
    get_outputs
}

# Run main function
main