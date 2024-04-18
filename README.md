# Project diagram 

![313510656-57dafa0a-8016-49f0-b32d-f92674e3ac2e](https://github.com/Tanay03Trivedi/Tanay03Trivedi-vpc-project-realtime-using-Terraform/assets/160705084/aa2bea5c-eee2-4bee-a76e-0910b89b64c1)

### terra form cmd 
- terraform init
- terraform plan
- terraform apply -auto -approve
# All of the below processes done by Terraform 

## Step – 1 

### Create vpc with (2 private, 2 public ) subnets in different availability zones,2 Nat gateway in a different availability zone, one internet gateway

## step – 2

go to the auto-scaling group

create auto-scaling group

create launch template
 
select os
 
select instance type

create a security group in the created vpc  and select it in the launch template

select launch template

in instance, launch options select vpc and private subnets and zones

in the advanced option select an application load balancer – internet-facing

in group size desired capacity 1 scaling limit 1 max desired capacity 1 no scaling
 
policy, no instance maintenance policy

review the configuration and create auto scaling group

## step - 3

create 2 instances as a bastion host
 
## step - 4

connect the private IP host and deploy the webserver

## step -5

register the private subnet instance in the load balancer
 
## step – 6
 
copy dns name and test for replay from both web server

## end of terraform cmd

![Screenshot 2024-04-12 234037](https://github.com/Tanay03Trivedi/vpc-project-realtime-using-Terraform/assets/160705084/5d9a870c-169b-473b-bc48-28302ead530a)

# Linux commands for this project as below
sudo –I
 - apt-get update
 - nano x		#x = any name to a file
	- 	#paste the ssh key in this file 
		- #then press ctrl+o 
	- 	#enter
	-	#ctrl+x
 - ls                    		#for checking the file created is there
- chmod  x 400    	#to give read-only permission 
 - ssh –I prac-account-ssh ubantu@xxxx.xxxx.xxxx.xxxx
 - yes
		# After connection established
 - sudo –I
- apt-get update
- apt install nginx 
 - y
- service nginx status
- echo “hello from $(hostname)” > /var/www/html/index.html
- curl localhost  
	

![Screenshot 2024-03-18 043746](https://github.com/Tanay03Trivedi/VPC-project/assets/160705084/a92e2116-9291-4312-8526-c04728bc4dcd)
![Screenshot 2024-03-18 043754](https://github.com/Tanay03Trivedi/VPC-project/assets/160705084/6e63334c-a929-467e-89c0-c05e1db2bc50)
