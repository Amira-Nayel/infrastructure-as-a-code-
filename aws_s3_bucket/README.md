# Terraform AWS S3 Setup for Moodle Backup

This repository contains Terraform configuration files to set up an AWS S3 bucket and upload objects to it. The purpose of this setup is to create a backup system for Moodle and other projects.

## Project Structure

- `main.tf`: Main Terraform configuration file that defines the resources.
- `variables.tf`: Variables file (if you are using variables).
- `outputs.tf`: Outputs file (if you are using outputs).
- `README.md`: Project documentation.

## Resources Created

This Terraform configuration creates the following resources in AWS:

1. **S3 Bucket**: A bucket named `insigth-learn-backup` for storing backups.
2. **S3 Objects**: 
   - `MoodleDB/`
   - `Morphcast/`
   - `whole_project/`

All objects have a private access control list (ACL).

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with appropriate access credentials.

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
