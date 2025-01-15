# kubernetes-notes
## Overview
![miro's medium picture](https://miro.medium.com/v2/resize:fit:2000/format:webp/1*kSRH4T8S1YmAuHbpgQ3Ylw.png)
The image is from [Miro's medium](https://medium.com/devops-mojo/kubernetes-architecture-overview-introduction-to-k8s-architecture-and-understanding-k8s-cluster-components-90e11eb34ccd)

## Set up for this lab environment
### Install kubectl

<details>
<summary>MacOS (Apple Silicon)</summary>

> Download the latest version ([official website](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/))
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
```
> Move the kubectl to a file location on your system
```bash
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl
```

> Test to ensure the version you installed is up-to-date
```bash
kubectl version --client
```

**Alternative: Using HomeBrew**
```bash
brew install kubectl

# Test it
kubectl version --client
```
</details>

<details>
<summary>WSL (Windows Subsystem for Linux)</summary>

> Download the latest version
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

> Validate the binary (optional)
```bash
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

> Install kubectl
```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Test it
kubectl version --client
```
</details>

### Install Minikube
<details>
<summary>MacOS (Apple Silicon)</summary>

```bash
# Using Homebrew
brew install minikube

# Or using direct download
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube

# Test the installation
minikube version

# Start Minikube
minikube start

# Check status
minikube status

# View the Kubernetes dashboard (optional)
minikube dashboard
```
</details>

<details>
<summary>WSL (Windows Subsystem for Linux)</summary>

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Test the installation
minikube version

# Start Minikube
minikube start --driver=docker

# Check status
minikube status

# View the Kubernetes dashboard (optional)
minikube dashboard
```

Note: Make sure Docker is installed and running in WSL before starting Minikube.
</details>

### Install Kubecolor (Optional - for colored output)
<details>
<summary>MacOS (Apple Silicon)</summary>

```bash
# Using Homebrew
brew install hidetatz/tap/kubecolor

# Add alias to your shell configuration file
echo 'alias kubectl="kubecolor"' >> ~/.zshrc

# Reload shell configuration
source ~/.zshrc

# Test the colored output
kubectl get pods
```

Note: Kubecolor will automatically use kubectl's configuration, no additional setup needed.
</details>

<details>
<summary>WSL (Windows Subsystem for Linux)</summary>

```bash
# Download the tar.gz file
wget https://github.com/kubecolor/kubecolor/releases/download/v0.5.0/kubecolor_0.5.0_linux_amd64.tar.gz

# Extract the archive
mkdir -p kubecolor
tar -xzf ./kubecolor_0.5.0_linux_amd64.tar.gz -C kubecolor

# Move the binary to your PATH (may require sudo)
sudo mv kubecolor/kubecolor /usr/local/bin/

# Add alias to your shell configuration file
echo 'alias kubectl="kubecolor"' >> ~/.zshrc

# Reload shell configuration
source ~/.zshrc

# Test the colored output
kubectl get pods

# Remove the kubecolor directory
rm -rf kubecolor

# Remove the tar.gz file
rm -rf kubecolor_0.5.0_linux_amd64.tar.gz
```

Note: Check for newer versions at [kubecolor releases](https://github.com/hidetatz/kubecolor/releases)
</details>

<details>
<summary>Additional Kubecolor Configuration</summary>

You can also add these optional aliases for enhanced experience:
```bash
# Add these to your ~/.zshrc

# Preserve colored output when piping (e.g., kubectl get pods | grep something)
alias kubectl="kubecolor -p"

# Use specific color scheme
alias kubectl="kubecolor --light-background" # For light terminal themes
alias kubectl="kubecolor --dark-background"  # For dark terminal themes

# Disable colorization for specific commands
alias kubectl="kubecolor --force-colors=false"
```

To temporarily use kubectl without colors, you can either:
1. Use `command kubectl` instead of `kubectl`
2. Use the full path `/usr/local/bin/kubectl`
</details>
