- name: Provision a Google Compute Engine instance
  hosts: localhost
  gather_facts: no
  tasks:
    - name: Create a GCE instance
      google.cloud.gcp_compute_instance:
        name: "ansible-gce-instance"
        machine_type: "e2-medium"
        zone: "us-central1-a"
        project: "<YOUR_GCP_PROJECT_ID>"
        auth_kind: "serviceaccount"
        service_account_file: "/path/to/your/service-account.json"
        network_interfaces:
          - network: "global/networks/default"
            access_configs:
              - name: "External NAT"
                type: "ONE_TO_ONE_NAT"
        disks:
          - auto_delete: true
            boot: true
            initialize_params:
              source_image: "projects/debian-cloud/global/images/family/debian-11"
        state: "present"
      register: gce_instance

    - name: Display instance information
      debug:
        msg: "Instance {{ gce_instance.name }} created with public IP {{ gce_instance.networkInterfaces[0].accessConfigs[0].natIP }}"
