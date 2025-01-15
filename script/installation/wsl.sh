#!/bin/bash

echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "Installing kubecolor..."
curl -LO https://github.com/kubecolor/kubecolor/releases/download/v0.5.0/kubecolor_0.5.0_linux_arm64.tar.gz
tar xzvf kubecolor_0.5.0_linux_arm64.tar.gz
sudo mv kubecolor /usr/local/bin/
rm kubecolor_0.5.0_linux_arm64.tar.gz

echo "Installing kubectx..."
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

echo "Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

echo "Adding aliases to .zshrc..."
cat << 'EOF' >> ~/.zshrc

# Kubernetes aliases
alias kubectl="kubecolor"
alias kctx="kubectx"
alias kns="kubens"
EOF

echo "Installation complete! Please run 'source ~/.zshrc' to apply changes"
echo "Note: Make sure Docker Desktop is installed and WSL integration is enabled"
