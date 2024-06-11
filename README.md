# Infrastructure as Code 
![77befea2-7041-4c6c-9ec7-d75bb60b21c6](https://github.com/AMMA02/IaC/assets/131775951/9bae5a8f-c181-4a15-99a8-c1642dd1401b)
Infrastructure Overview
Infrastructure refers to the combination of hardware and software services provided by various companies that support our project. In this project, we utilize two cloud providers: Microsoft Azure and Amazon Web Services (AWS). The project predominantly leverages Azure for most resources and AWS for storage services.
Azure Components
1.	Resource Group:
•	A container that holds related resources for an Azure solution.
2.	Virtual Machines (VMs):
•	Compute resources that function similarly to physical computers, running an operating system and applications, but virtualized and hosted in the cloud.
•	Specifications:
o	Type: Standard D2s v3 (2 vCPUs, 8 GiB memory)
o	OS: Ubuntu Server 22.04 LTS
3.	Public IP Address:
•	IP addresses assigned to Azure resources to allow them to communicate with the internet or other Azure resources.
•	Types: Dynamic and Static. We use a Static IP (4.227.176.131) to ensure the IP address remains constant, enabling consistent accessibility.
4.	Network Security Group (NSG):
•	Manages and controls network traffic to Azure resources.
•	Contains rules defining allowed or denied inbound and outbound traffic.
•	Inbound rules for the VM:
o	SSH (Port 22, TCP)
o	HTTP (Port 80, TCP)
o	HTTPS (Port 443, TCP)
o	MySQL (Port 3306, TCP)
5.	Snapshot:
•	A point-in-time image of a system's data or state, capturing the entire state of a system, including memory, settings, and disk data.
•	Used for backups, disaster recovery, and testing. In case of an issue with the VM, we can create a new VM and disk from a snapshot as part of our Disaster Recovery (DR) plan.

AWS Components
Amazon S3 (Simple Storage Service):
•	Designed to store and retrieve any amount of data from anywhere on the web.
•	Features: Scalability, high availability, and security.
•	Usage: Storing backups.
•	S3 Bucket: insight-learn-backup, divided into three directories:
	MoodleDB/
	Morphcast/
	whole_project/
•	Each directory receives a copy of its respective database data.
Infrastructure as Code (IaC)
We create and manage the infrastructure using an Infrastructure as Code (IaC) tool. IaC allows us to define, deploy, and manage infrastructure through code, making it easier to automate, replicate, and scale our environments.
•	Cloud Formation (AWS)
•	Azure Resource Manager (ARM) Templates (Azure)
•	Terraform (our chosen tool):
o	An open-source IaC tool that supports multiple cloud providers including AWS, Azure, GCP, Alibaba, Digital Ocean, and Oracle.

Terraform
Terraform is an open-source IaC tool created by HashiCorp. It allows for the provisioning of infrastructure across various cloud providers using a simple, declarative language.



Deployment Process
1.	Provisioning Infrastructure:
•	Define the infrastructure in Terraform configuration files.
•	Use Terraform to create the necessary resources in Azure and AWS.
2.	Accessing the Virtual Machine:
•	Connect to the VM via SSH using credentials created during the provisioning process.
•	Example: Installing Ubuntu Server 22.04 LTS, PHP 7.3, MariaDB, and Nginx web server.
3.	Installing and Configuring Services:
•	Set up the environment for the Moodle platform (version 4.1).

 
Automated Backup
Bash Script:
•	A plain text file with a series of commands written in the Bash scripting language.
•	Used to automate tasks, run sequences of commands, and perform complex operations without manual intervention.



 
Cron Job: 
•	A time-based job scheduler in Unix-like operating systems.
•	Schedules jobs to run periodically at fixed times, dates, or intervals.
•	Example Cron Job:
![image](https://github.com/AMMA02/IaC/assets/131775951/ed3e8622-76ed-4158-b17c-dcdced21f96d)


This is scheduled to run a backup script at midnight on the first day of every month. The script changes the directory to /home/azureuser/, executes the backup_to_s3-3db.sh script, and saves the output to a log file named backup-log.txt.
Diagram:





![infrastructure](https://github.com/AMMA02/IaC/assets/131775951/2ee88c40-51d4-48ff-a837-d377a18ccc15)





The diagram illustrates the infrastructure setup where an HTTP request from a user is allowed or denied by the Network Security Group (NSG) in Azure. If allowed, the NSG permits an SSH connection to the virtual machine (VM). The VM, secured by the NSG, runs backup scripts that generate SQL files. These SQL files are then transferred to an Amazon S3 bucket in AWS for storage. The infrastructure is managed using Terraform, as indicated by its logo in the diagram.

