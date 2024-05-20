# Infrastructure as Code On Azure
# README for Terraform Project: Create VM on Azure with Security Group

## Project Overview

This Terraform project sets up a virtual machine (VM) on Azure with a specified network configuration, public IP, and network security group. The resources created in this project include a resource group, virtual network, subnet, public IP address, network interface, virtual machine, and network security group with specific rules for HTTP, HTTPS, SSH, and MariaDB.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure CLI installed and configured
- Azure subscription

## Configuration Details

### Resources Created

1. **Resource Group**
   - Name: `moodle`
   - Location: `East US`

2. **Virtual Network**
   - Name: `moodlenetwork`
   - Address Space: `10.0.0.0/16`
   - Location: `East US`
   - Resource Group: `moodle`

3. **Subnet**
   - Name: `internal`
   - Address Prefix: `10.0.1.0/24`
   - Resource Group: `moodle`
   - Virtual Network: `moodlenetwork`

4. **Public IP Address**
   - Name: `moodleip`
   - Allocation Method: `Static`
   - Location: `East US`
   - Resource Group: `moodle`

5. **Network Interface**
   - Name: `moodlenic`
   - Location: `East US`
   - Resource Group: `moodle`
   - IP Configuration:
     - Name: `moodleip`
     - Subnet ID: `internal`
     - Private IP Allocation: `Static`
     - Private IP Address: `10.0.1.5`
     - Public IP Address ID: `moodleip`

6. **Virtual Machine**
   - Name: `moodlevm`
   - VM Size: `Standard_DS1_v2`
   - Location: `East US`
   - Resource Group: `moodle`
   - Network Interface IDs: `moodlenic`
   - OS Disk:
     - Name: `myosdisk1`
     - Caching: `ReadWrite`
     - Create Option: `FromImage`
     - Managed Disk Type: `Standard_LRS`
   - OS Profile:
     - Computer Name: `moodleserver`
     - Admin Username: `it-admin`
     - Admin Password: `Password1234!`
   - OS Profile Linux Config:
     - Disable Password Authentication: `false`

7. **Network Security Group**
   - Name: `webserver`
   - Location: `East US`
   - Resource Group: `moodle`
   - Security Rules:
     - Allow HTTP on port 80
     - Allow HTTPS on port 443
     - Allow SSH on port 22
     - Allow MariaDB on port 3306

### Output

- Public IP Address of the VM

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

4. **Access the VM**
   - Use the outputted public IP address to access your VM.

## Cleanup

To remove all resources created by this project, run:
```sh
terraform destroy
```
- Review the plan and type `yes` to confirm.

## Notes

- Make sure to replace placeholder values like `<repository_url>` and `<repository_directory>` with actual values.
- Ensure that the admin password meets Azure's complexity requirements.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

---

Feel free to customize the content according to your specific requirements.
