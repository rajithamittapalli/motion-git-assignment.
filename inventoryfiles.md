1. AWS Inventory (Static)
This is a basic static inventory file for AWS EC2 instances:

yaml
Copy
Edit
---
all:
  children:
    aws:
      hosts:
        aws_instance_1:
          ansible_host: ec2-11-22-33-44.compute-1.amazonaws.com
          ansible_user: ec2-user
          ansible_ssh_private_key_file: /path/to/aws_key.pem
        aws_instance_2:
          ansible_host: ec2-55-66-77-88.compute-1.amazonaws.com
          ansible_user: ec2-user
          ansible_ssh_private_key_file: /path/to/aws_key.pem

    # Optional group for specific AWS instances
    webservers:
      hosts:
        aws_instance_1

    dbservers:
      hosts:
        aws_instance_2

  vars:
    ansible_python_interpreter: /usr/bin/python3
2. Azure Inventory (Static)
This is a basic static inventory file for Azure Virtual Machines:

yaml
Copy
Edit
---
all:
  children:
    azure:
      hosts:
        azure_vm_1:
          ansible_host: 10.1.1.1
          ansible_user: azureuser
          ansible_ssh_private_key_file: /path/to/azure_key.pem
        azure_vm_2:
          ansible_host: 10.1.1.2
          ansible_user: azureuser
          ansible_ssh_private_key_file: /path/to/azure_key.pem

    # Optional group for specific Azure VMs
    webservers:
      hosts:
        azure_vm_1

    dbservers:
      hosts:
        azure_vm_2

  vars:
    ansible_python_interpreter: /usr/bin/python3
3. GCP Inventory (Static)
This is a basic static inventory file for Google Cloud Compute Engine instances:

yaml
Copy
Edit
---
all:
  children:
    gcp:
      hosts:
        gcp_instance_1:
          ansible_host: 35.230.100.101
          ansible_user: gcp-user
          ansible_ssh_private_key_file: /path/to/gcp_key.pem
        gcp_instance_2:
          ansible_host: 35.230.100.102
          ansible_user: gcp-user
          ansible_ssh_private_key_file: /path/to/gcp_key.pem

    # Optional group for specific GCP instances
    webservers:
      hosts:
        gcp_instance_1

    dbservers:
      hosts:
        gcp_instance_2

  vars:
    ansible_python_interpreter: /usr/bin/python3
4. AWS Inventory (Dynamic)
For AWS, you can use Ansible's dynamic inventory feature. Below is the configuration for AWS EC2 instances:

yaml
Copy
Edit
plugin: aws_ec2
regions:
  - us-east-1
filters:
  instance_state_name: running
keyed_groups:
  - key: tags.Name
    prefix: aws_
  - key: instance_type
    prefix: instance_
hostnames:
  - dns_name
To use this dynamic inventory, you must have AWS credentials configured (either through environment variables or the ~/.aws/credentials file). This plugin fetches running EC2 instances dynamically based on the region and filters you specify.

5. Azure Inventory (Dynamic)
For Azure, you can configure Ansible to fetch resources dynamically:

yaml
Copy
Edit
plugin: azure.azcollection.azure_rm
client_id: YOUR_CLIENT_ID
secret: YOUR_SECRET
tenant: YOUR_TENANT_ID
subscription_id: YOUR_SUBSCRIPTION_ID
groups:
  - location
  - resource_group
  - vm_size
This configuration fetches Azure VMs based on the given parameters, such as location, resource group, or VM size.

6. GCP Inventory (Dynamic)
For Google Cloud Platform, you can use the gce plugin for dynamic inventory:

yaml
Copy
Edit
plugin: gce
projects:
  - your-project-id
auth_kind: serviceaccount
service_account_file: /path/to/your/service-account-key.json
hostnames:
  - name
keyed_groups:
  - key: labels.env
    prefix: env_
  - key: name
    prefix: gce_
This configuration pulls information from your GCP project using a service account key.
