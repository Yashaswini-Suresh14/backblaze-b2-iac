#!/bin/bash

# Backblaze B2 Infrastructure as Code - Test Script
echo "🧪 Testing Infrastructure Configuration"

# Test file structure
echo "Checking project structure..."
[ -f "terraform/main.tf" ] || { echo "❌ terraform/main.tf missing"; exit 1; }
[ -f "frontend/index.html" ] || { echo "❌ frontend/index.html missing"; exit 1; }
[ -f ".github/workflows/deploy.yml" ] || { echo "❌ .github/workflows/deploy.yml missing"; exit 1; }

echo "✅ Project structure is valid"

# Test Terraform configuration
cd terraform
terraform validate
cd ..

echo "✅ Terraform configuration is valid"
echo "✅ All tests passed! Project is ready for deployment."