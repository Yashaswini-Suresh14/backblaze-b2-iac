# Architecture Documentation

## System Overview

This project implements Infrastructure as Code (IaC) for deploying and managing cloud infrastructure on Backblaze B2 using Terraform and GitHub Actions.

## Architecture Diagram
┌─────────────────┐ ┌──────────────────┐
┌─────────────────┐
│ Developer │ │ GitHub │ │ Terraform │
│ Code │───▶│ Repository │───▶│ Configuration │
└─────────────────┘ └──────────────────┘ └─────────────────┘
│
▼
┌─────────────────┐ ┌──────────────────┐ ┌─────────────────┐
│ GitHub │ │ Backblaze B2 │ │ Static │
│ Actions │───▶│ Cloud Storage │───▶│ Website │
│ CI/CD │ │ │ │ │
└─────────────────┘ └──────────────────┘ └─────────────────┘
│
▼
┌─────────────────┐
│ End Users │
│ Worldwide │
└─────────────────┘

## Component Architecture

### 1. Terraform Infrastructure Layer

#### 1.1 Configuration Files
terraform/
├── main.tf # Primary resource definitions
├── variables.tf # Input variables and parameters
├── outputs.tf # Output values and URLs
└── providers.tf # Provider configurations


#### 1.2 Resource Definitions
- **Backblaze B2 Buckets**: 
  - `b2_bucket.static_website` - Public bucket for website hosting
  - `b2_bucket.uploads` - Private bucket for file storage
  
- **Application Keys**:
  - `b2_application_key.ci_cd_key` - Automated deployment credentials

### 2. GitHub Actions CI/CD Pipeline

#### 2.1 Workflow Triggers
- **Push Events**: Automatic deployment on main/master branch updates
- **Pull Requests**: Validation and testing on PR creation
#### 2.2 Pipeline Stages
Code Checkout → 2. Terraform Setup → 3. Credential Config
↓ ↓ ↓

Terraform Plan → 5. Terraform Apply → 6. Output Generation

### 3. Backblaze B2 Cloud Infrastructure

#### 3.1 Storage Architecture
Backblaze B2 Storage:
├── Website Bucket (Public)
│ ├── index.html
│ ├── css/style.css
│ └── js/app.js
│
└── Uploads Bucket (Private)
└── (Future file uploads)

#### 3.2 Security Implementation
- **Encrypted Secrets**: B2 credentials in GitHub Secrets
- **Least Privilege**: Minimal required permissions
- **CORS Configuration**: Web application compatibility

### 4. Frontend Application Layer

#### 4.1 Static Website Structure
frontend/
├── index.html # Main application
├── css/style.css # Styling
└── js/app.js # Client-side functionality

### 5. Deployment Workflow

#### 5.1 Automated Deployment Process
Developer → Git Push → GitHub Actions → Terraform → Backblaze B2 → Live Website
Developer → Git Push → GitHub Actions → Terraform → Backblaze B2 → Live Website

#### 5.2 Environment Strategy
- **Development**: Testing and iteration
- **Production**: Live deployment

### 6. Cost Architecture

#### 6.1 Cost Comparison
| Component | Backblaze B2 | AWS S3 | Savings |
|-----------|--------------|--------|---------|
| Storage   | $5/TB/month  | $23/TB/month | 78% |
| Download  | FREE         | $9/TB  | 100% |
| **Total** | **~$0/month**| **~$9/month**| **100%**|

#### 6.2 Free Tier Benefits
- **Storage**: 10GB free
- **Download**: 1GB/day free
- **Operations**: Generous free tier

### 7. Security Architecture

#### 7.1 Authentication
- **Backblaze B2**: Application key authentication
- **GitHub Actions**: Encrypted secrets
- **Terraform**: Local state management

#### 7.2 Data Protection
- **Encryption**: Server-side encryption
- **HTTPS**: Secure data transfer
- **Access Control**: Bucket policies

### 8. Scalability

#### 8.1 Horizontal Scaling
- **Multiple Buckets**: Load distribution
- **CDN Integration**: Global delivery
- **Auto-scaling**: Based on traffic

#### 8.2 Performance Targets
- **Load Time**: < 2 seconds
- **Availability**: 99.9%
- **Scalability**: 10,000+ daily visitors

### 9. Monitoring

#### 9.1 Key Metrics
- **Performance**: Website load times
- **Infrastructure**: Bucket health
- **Costs**: Storage and transfer usage

#### 9.2 Logging
- **Application Logs**: Frontend errors
- **Deployment Logs**: GitHub Actions logs
- **Infrastructure Logs**: Terraform execution

## Technical Specifications

### Requirements
- **Terraform**: Version 1.0+
- **Backblaze B2 Account**: With application keys
- **GitHub Account**: For repository and Actions
- **Git**: Version control

### Performance
- **Deployment Time**: < 5 minutes
- **Website Performance**: Optimized for speed
- **Reliability**: High availability design

## Architecture Principles

1. **Infrastructure as Code**: Everything defined in code
2. **Automation First**: Minimize manual intervention
3. **Security by Design**: Built-in security measures
4. **Cost Effective**: Optimized for budget
5. **Scalability Ready**: Easy to expand

## Benefits

### Technical Benefits
- **Reproducibility**: Consistent deployments
- **Version Control**: Track infrastructure changes
- **Automation**: Reduced manual errors
- **Collaboration**: Team-based development

### Business Benefits
- **Cost Savings**: 75% cheaper than AWS
- **Speed**: Rapid deployment
- **Reliability**: Automated recovery
- **Scalability**: Growth ready

## Future Enhancements

### Planned Features
1. **Cloudflare CDN Integration**
2. **Automated Testing Pipeline**
3. **Multi-environment Support**
4. **Advanced Monitoring Dashboard**

### Technology Roadmap
- **Phase 1**: Basic IaC implementation ✓
- **Phase 2**: Enhanced monitoring
- **Phase 3**: Multi-cloud support
- **Phase 4**: Advanced security

---
*Architecture Version: 1.0*
*Project: Backblaze B2 Infrastructure as Code*
*Status: Production Ready*