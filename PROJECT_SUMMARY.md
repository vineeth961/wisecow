(Wisecow Project)

Cow Wisdom Web Server

{Prerequisites}

Install required packages:

sudo apt install fortune-mod cowsay -y

How to Use:

Run the application:

./wisecow.sh


Access the web server in your browser:

http://127.0.0.1:4499



What to Expect:

You should see wisecow output in your browser when accessing the above URL.


Problem Statement:

Deploy the Wisecow application as a Kubernetes app.


{Project Requirements}

Create a Dockerfile for the Wisecow application.

Craft Kubernetes manifests for deployment and service exposure.

Implement GitHub Actions workflow to automatically build and push Docker images whenever code changes are committed.



{Project Artifacts}

GitHub repository containing:

Wisecow application source code

Dockerfile for the application

Kubernetes manifest files (wisecow-deployment.yaml, wisecow-service.yaml)

CI/CD GitHub Actions workflow file

Screenshots demonstrating deployment and running application


{Deployment Overview}

Docker Image:

Built from Dockerfile in repo

Pushed to GitHub Container Registry (GHCR)


Kubernetes Deployment:

Pods deployed using wisecow-deployment.yaml

Service exposed via NodePort

Port forwarding used to access the app locally on 4499:

"kubectl port-forward wisecow-deployment 4499:4499"


GitHub Actions (CI/CD):

Automates Docker image build and push on main branch commits

Manual deployment used for Kubernetes due to CI/CD environment limitations


Screenshots:

Kubernetes pods running (kubectl get pods)

Wisecow app in browser

Docker image in GHCR


Access Control:

Repository is public
