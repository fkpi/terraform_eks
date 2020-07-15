1. Use terraform apply. You will need to provide variables either by entering them by hand when using terraform commands, or by creating terraform.tfvars file.
   This step will create EKS Cluster on AWS with a Node Group.
   
      `terraform apply`
2. Configure kubectl to work with created EKS Cluster. You will need to have AWS CLI configured and AWS IAM Authenticator installed on your machine.

     `aws eks update-kubeconfig --name YOUR-EKS_CLUSTER_NAME`

3. Deploy Apache Web Server:

     `kubectl apply -f k8s_apache.yaml`

4. /index.html should now be accessible through Load Balancer DNS Address
