#!/bin/bash

# Talkify Deployment Script
# This script helps you deploy your Talkify app step by step

echo "🚀 Talkify Deployment Helper"
echo "=============================="
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Git Setup
echo -e "${BLUE}Step 1: Git Setup${NC}"
echo "Your git repository has been initialized!"
echo ""

# Step 2: Commit Code
echo -e "${BLUE}Step 2: Commit Your Code${NC}"
echo "Running: git add ."
git add .

echo "Running: git commit"
git commit -m "Initial commit: Talkify video chat app with purple/blue theme and advanced features"

echo -e "${GREEN}✓ Code committed successfully!${NC}"
echo ""

# Step 3: GitHub Remote
echo -e "${BLUE}Step 3: Add GitHub Remote${NC}"
echo -e "${YELLOW}⚠️  ACTION REQUIRED:${NC}"
echo "1. Go to https://github.com/new"
echo "2. Create a new repository named: talkify-video-chat"
echo "3. Do NOT initialize with README, .gitignore, or license"
echo "4. Copy the repository URL"
echo ""
read -p "Enter your GitHub username: " github_username
echo ""

if [ ! -z "$github_username" ]; then
    git remote add origin https://github.com/$github_username/talkify-video-chat.git
    echo -e "${GREEN}✓ Remote added: https://github.com/$github_username/talkify-video-chat.git${NC}"
    echo ""
    
    # Step 4: Push to GitHub
    echo -e "${BLUE}Step 4: Push to GitHub${NC}"
    read -p "Ready to push? (y/n): " ready
    
    if [ "$ready" = "y" ] || [ "$ready" = "Y" ]; then
        git branch -M main
        git push -u origin main
        echo -e "${GREEN}✓ Code pushed to GitHub!${NC}"
        echo ""
        echo "🎉 Your code is now on GitHub!"
        echo "Repository: https://github.com/$github_username/talkify-video-chat"
    else
        echo "Skipping push. Run 'git push -u origin main' when ready."
    fi
else
    echo -e "${YELLOW}Skipping remote setup. Add it manually with:${NC}"
    echo "git remote add origin https://github.com/YOUR_USERNAME/talkify-video-chat.git"
fi

echo ""
echo -e "${BLUE}=============================="
echo "Next Steps:"
echo -e "==============================${NC}"
echo ""
echo "📖 Read DEPLOYMENT_GUIDE.md for detailed instructions"
echo ""
echo "Frontend Deployment (Vercel):"
echo "  1. Go to https://vercel.com"
echo "  2. Import your GitHub repository"
echo "  3. Set Root Directory: frontend"
echo "  4. Add environment variables (see DEPLOYMENT_GUIDE.md)"
echo "  5. Deploy!"
echo ""
echo "Backend Deployment (Render):"
echo "  1. Go to https://render.com"
echo "  2. Create new Web Service"
echo "  3. Set Root Directory: backend"
echo "  4. Add environment variables (see DEPLOYMENT_GUIDE.md)"
echo "  5. Deploy!"
echo ""
echo "✨ Happy deploying!"
