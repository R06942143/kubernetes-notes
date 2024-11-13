# kubernetes-notes
## Overview
![miro's medium picture](https://miro.medium.com/v2/resize:fit:2000/format:webp/1*kSRH4T8S1YmAuHbpgQ3Ylw.png)
The image is from [Miro's medium](https://medium.com/devops-mojo/kubernetes-architecture-overview-introduction-to-k8s-architecture-and-understanding-k8s-cluster-components-90e11eb34ccd)
## Set up for this lab environment
### Install kubectl for MacOS(Apple Silicon)
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

or you can install by the HomeBrew
> Install kubectl by HomeBrew
```bash
brew install kubectl
```

> Test it
```bash
kubectl version --client
```

### Install Minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
