// Backblaze B2 Infrastructure as Code - Frontend JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Update deployment info
    updateDeploymentInfo();
    
    // Add interactive features to feature cards
    initFeatureCards();
    
    // Add animation to architecture steps
    initArchitectureAnimation();
    
    // Display current date and time
    updateDateTime();
});

function updateDeploymentInfo() {
    const deploymentInfo = document.getElementById('deployment-info');
    const info = {
        deployed: new Date().toLocaleDateString(),
        technology: 'Backblaze B2 + Terraform + GitHub Actions',
        cost: '$0/month (Free Tier)',
        storage: '10GB Free Storage'
    };
    
    deploymentInfo.innerHTML = `
        Deployed on: ${info.deployed} | 
        Technology: ${info.technology} |
        Cost: ${info.cost} |
        ${info.storage}
    `;
}

function initFeatureCards() {
    const featureCards = document.querySelectorAll('.feature-card');
    
    featureCards.forEach(card => {
        // Add click animation
        card.addEventListener('click', function() {
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = '';
            }, 150);
        });
        
        // Add hover sound effect (visual only)
        card.addEventListener('mouseenter', function() {
            this.style.transition = 'all 0.3s ease';
        });
    });
}

function initArchitectureAnimation() {
    const steps = document.querySelectorAll('.step');
    
    // Animate steps with delay
    steps.forEach((step, index) => {
        setTimeout(() => {
            step.style.opacity = '0';
            step.style.transform = 'translateY(20px)';
            step.style.transition = 'all 0.5s ease';
            
            setTimeout(() => {
                step.style.opacity = '1';
                step.style.transform = 'translateY(0)';
            }, 100);
        }, index * 200);
    });
}

function updateDateTime() {
    const now = new Date();
    const dateTimeString = now.toLocaleString();
    
    // Update every minute
    setInterval(() => {
        const now = new Date();
        const dateTimeString = now.toLocaleString();
        console.log('Infrastructure as Code Project - Live:', dateTimeString);
    }, 60000);
}

// Utility function to simulate API call
async function simulateDeployment() {
    const steps = [
        'Initializing Terraform...',
        'Planning infrastructure changes...',
        'Creating Backblaze B2 bucket...',
        'Configuring application keys...',
        'Uploading website files...',
        'Deployment complete! 🚀'
    ];
    
    for (let i = 0; i < steps.length; i++) {
        console.log(`Step ${i + 1}/${steps.length}: ${steps[i]}`);
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
    
    return 'Deployment successful!';
}

// Export for potential module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        updateDeploymentInfo,
        simulateDeployment
    };
}