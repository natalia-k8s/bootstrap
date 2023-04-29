# Sample setup for a HA Kubernetes cluster

This project contains files and commands used to set up a sample Kubernetes cluster in Google Cloud. The cluster is set up with the HA approach.

## Terraform directory 
Contains the files needed for provisioning cloud resources: VPC, subnet, firewalls and VMs. It provisions 3 kubernetes masters (for HA) and 3 workers.

Disclaimer: All VMs are running on preemptible instances to save costs.

## Ansible directory 
Contains inventory file and playbooks to provision kubernetes nodes and an HAproxy load balancer.

Here's the command to run a playbook:
```console
ansible-playbook -i inventory/k8s-cluster playbooks/install-k8s-lb.yml -e host_group=kubernetes_lb
```

## Files directory
Contains manual steps to set up the cluster after Terraform and Ansible parts are run. These weren't automated due to the lack of time.

## Kubernetes cluster metrics
To get an overview of cluster metrics a simple Metrics Server has been deployed. Use `kubectl top` command to display metrics.