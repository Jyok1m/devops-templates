#!/bin/bash

# Description: Installs AWS CLI v2 on macOS if not already installed, then runs aws configure
# Usage      : ./install-aws-cli.sh

set -e

echo "🔍 Checking if AWS CLI is already installed..."

if command -v aws &> /dev/null
then
    echo "✅ AWS CLI is already installed:"
    aws --version
    exit 0
else
    echo "⏬ AWS CLI not found. Proceeding with installation..."
fi

# Download the AWS CLI package
echo "📦 Downloading AWS CLI v2 package..."
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

# Install the package
echo "⚙️ Installing AWS CLI v2..."
sudo installer -pkg AWSCLIV2.pkg -target /

# Verify installation
echo "🔁 Verifying installation..."
aws --version

# Remove the installer package
echo "🧹 Cleaning up..."
rm AWSCLIV2.pkg

# Launch aws configure
echo "🔐 Launching AWS CLI configuration..."
aws configure

# Display credentials file path
echo "📁 You can verify your credentials here:"
echo "    cat ~/.aws/credentials"

echo "🎉 AWS CLI installation and configuration complete!"