#!/bin/bash

# Backblaze B2 Infrastructure as Code - Setup Script
echo "🚀 Setting up Backblaze B2 Infrastructure as Code Project"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if Terraform is installed
check_terraform() {
    if command -v terraform &> /dev/null; then
        TERRAFORM_VERSION=$(terraform version | head -n1)
        print_status "Terraform found: $TERRAFORM_VERSION"
    else
        print_error "Terraform not found. Please install Terraform from https://developer.hashicorp.com/terraform/downloads"
        exit 1
    fi
}

# Check if Backblaze B2 credentials are set
check_b2_credentials() {
    if [ -f "terraform/config.auto.tfvars" ]; then
        print_status "Backblaze B2 credentials file found"
    else
        print_warning "Backblaze B2 credentials not configured"
        echo "Please create terraform/config.auto.tfvars with your B2 credentials:"
        echo "b2_application_key_id = \"your_key_id_here\""
        echo "b2_application_key = \"your_application_key_here\""
    fi
}

# Initialize Terraform
init_terraform() {
    print_status "Initializing Terraform..."
    cd terraform
    terraform init
    cd ..
}

# Validate Terraform configuration
validate_terraform() {
    print_status "Validating Terraform configuration..."
    cd terraform
    terraform validate
    cd ..
}

# Main setup process
main() {
    echo "=================================================="
    echo "   Backblaze B2 Infrastructure as Code Setup"
    echo "=================================================="
    
    check_terraform
    check_b2_credentials
    init_terraform
    validate_terraform
    
    echo ""
    print_status "Setup completed successfully! 🎉"
    echo ""
    echo "Next steps:"
    echo "1. Add your Backblaze B2 credentials to terraform/config.auto.tfvars"
    echo "2. Run: ./scripts/deploy.sh to deploy your infrastructure"
    echo "3. Or push to GitHub to trigger automated deployment"
    echo ""
    echo "For more information, check docs/DEPLOYMENT.md"
}

# Run main function
main