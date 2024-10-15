Here, In this Doc we are going to create EKS cluster with a node through Terraform
Pre-requisites:- IAM ROLE, INSTANCE installed with TERRAFORM,AWS Account,AWS CLI, Kubectl

Terraform Installation:-
Got to this Official website and follow the instructions according to your OS requirement.
Link- https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli 

AWS CLI Installation:-
If you are uysing Amazon machine it will come as pre-Installed. Otherwise you need to install.
Link for official Doc for installation:- https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Kubectl Installation:-
Follow the below document and Install the kubectl according to your reqquirement.
Link:- https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html#kubectl-install-update

Create and IAM role and attach it Terraform installed EC2 Instance:-

1. First create an Iam role and add below policies:
   a. AdministratorAccess (This will be enough, otherwise you can give separately only below EKS policies)
   b. AmazonEKSClusterPolicy
   c. AmazonEKSWorkerNodePolicy
   d. AmazonEC2ContainerRegistryReadOnly
2. Once it is attached, go to role > click on Trust relationship > Edit and add below script and save it.

```
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```
Now run <sub> terraform  init </sub> and run 
