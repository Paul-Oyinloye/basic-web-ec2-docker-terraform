# basic-web-ec2-docker-terraform

1. Developer Stage 
•	I wrote your HTML webpage (index.html).
•	Then I added a Dockerfile that defines how this webpage runs inside a container (using NGINX to serve it).
 2. Docker Build & Push (GitHub Actions)
•	I pushed the code to GitHub.
•	GitHub Actions automatically started running (CI/CD pipeline):
o	It built the Docker image using your Dockerfile.
o	Logged into AWS ECR (Elastic Container Registry).
o	Pushed the built image to ECR
 3. AWS Infrastructure (EC2 + IAM + SSM)
•	I launched an EC2 instance (Amazon Linux 2023).
•	Attached an IAM Role with permissions for:
o	ECR (pull images)
o	SSM (remote control)
•	Installed and configured:
o	Docker (to run containers)
o	SSM Agent (to receive commands from GitHub)
•	Verified SSM connection to allow remote deploys.
 4. Automated Deployment (GitHub → EC2 via SSM)
•	The pipeline used AWS SSM (Systems Manager) to:
o	Connect to the EC2 instance remotely (no SSH needed).
o	Pull the latest image from ECR.
5. Web Hosting Result
•	My EC2 instance started serving the webpage through Docker.
•	The site became accessible at my EC2 Public IP (port 80).
 6. Continuous Deployment
•	Any future commit/push to the GitHub repo will:
o	Trigger the same pipeline.
o	Rebuild and push a new image.
o	Redeploy automatically — updating my live webpage
