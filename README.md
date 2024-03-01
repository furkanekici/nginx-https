# Nginx HTTPS Setup Script

This README provides detailed instructions on how to download and execute the `run.sh` script from the Nginx HTTPS GitHub repository. The script is designed to automate the setup of Nginx with HTTPS.

## Introduction

The `run.sh` script automates the configuration of Nginx to use HTTPS, simplifying the process of securing your web server. This guide will walk you through the steps to download, prepare, and execute the script.

## Prerequisites

Before proceeding, ensure you have the following:
- A Linux-based operating system.
- `curl` or `wget` installed to download the script.
- `bash` shell to execute the script.
- Sudo or root access may be required to execute certain commands within the script.

## Installation Steps

### Step 1: Download the Script

To download the `run.sh` script, use the following `curl` command:
curl -o run.sh https://raw.githubusercontent.com/furkanekici/nginx-https/main/run.sh

### Step 2: Set Execute Permissions

Change the script's permissions to make it executable:

chmod +x run.sh

### Step 3: Run the Script

Execute the script using `bash`:

bash run.sh


## Additional Information

- Review the script before executing to understand its actions.
- The script's functionality might require modifications based on your specific server setup or if you encounter any errors during execution.
