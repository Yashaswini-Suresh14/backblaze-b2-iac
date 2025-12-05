# Deployment Guide

## Prerequisites

1. **Backblaze B2 Account**
   - Sign up at [backblaze.com/b2](https://www.backblaze.com/b2/)
   - Create application key with read/write permissions

2. **Terraform Installed**
   - Download from [terraform.io](https://www.terraform.io/downloads)
   - Version 1.0 or higher required

3. **GitHub Account** (for CI/CD)
   - Free account at [github.com](https://github.com)

## Quick Start

### Option 1: Local Deployment

1. **Clone and setup:**
   ```bash
   git clone <your-repo-url>
   cd backblaze-b2-iac
   ./scripts/setup.sh