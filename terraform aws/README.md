# Infrastructure as Code On AWS 
# README for Terraform Project: Create EC2 on AWS with Security Group

## Project Overview

This Terraform project sets up an EC2 instance on AWS with a specified security group. The resources created in this project include an EC2 instance and a security group that allows traffic for SSH, HTTP, HTTPS, and MariaDB.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI installed and configured
- AWS account

## Configuration Details

### Resources Created

1. **EC2 Instance**
   - AMI: `ami-0e001c9271cf7f3b9`
   - Instance Type: `t2.micro`
   - Key Name: `ubuntu-key`
   - Security Groups: `webserverSG`
   - Tags:
     - Name: `webservervm`

2. **Security Group**
   - Name: `my-security-group`
   - Description: `Security group allowing SSH, HTTP, HTTPS, and MariaDB traffic`
   - Ingress Rules:
     - Allow SSH on port 22 from any IP
     - Allow HTTP on port 80 from any IP
     - Allow HTTPS on port 443 from any IP
     - Allow MariaDB on port 3306 from any IP
   - Egress Rules:
     - Allow all outbound traffic

## How to Use

1. **Clone the Repository**
   ```sh
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Initialize Terraform**
   ```sh
   terraform init
   ```

3. **Apply the Terraform Configuration**
   ```sh
   terraform apply
   ```
   - Review the plan and type `yes` to confirm.

4. **Access the EC2 Instance**
   - Use the key specified (`ubuntu-key`) to SSH into your instance using the public IP address.

## Cleanup

To remove all resources created by this project, run:
```sh
terraform destroy
```
- Review the plan and type `yes` to confirm.

## Notes

- Make sure to replace placeholder values like `<repository_url>` and `<repository_directory>` with actual values.
- Ensure that the key name (`ubuntu-key`) matches an existing key pair in your AWS account.
- Consider restricting the `cidr_blocks` in the security group for better security.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

---

Feel free to customize the content according to your specific requirements.
