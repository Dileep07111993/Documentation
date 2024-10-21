In this file we will see comonly faced issues in kubernetes.

Issues:-
1. If you receive below error it's related to authorization issue.
<sub>
E0209 21:09:47.869614 2465691 memcache.go:238] couldn't get current server API group list: the server has asked for the client to provide credentials
error: You must be logged in to the server (the server has asked for the client to provide credentials)
</sub>


To above issue mainly happening due to the the user of EKS cluster which you have crated doesn't configured for kubectl. 
Eg:- If you have created the EKS cluster with root user through console, If you want to authenticate it via Ec2 either with IAM User or Role it won't work because you haven't configured the root user credentials
     Ec2 by using 'aws configure' command. If you configure it the control plan will be accessible.
Not:- It's not recomanded way to configure the "Root credentials" directly on server. Suggested way is to create an IAM user with Admin permission and then login into the console with that credentials and
     create EKS cluster.


2. Another error is, While running 'kubectl get nodes' you will get the timeout error this is due to the nodes doesn't have allowed 443 port. Same for the cluster time out also.
