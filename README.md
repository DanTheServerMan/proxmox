# ProxMox Scripts - Ansible & Bash

This is a collection of scripts used with ProxMox VE.

Most scripts are related to posts made on dantheserverman.com

**initial-host-config:**

This Ansible playbook will configure NTP, DNS, NIC interface comments, a login banner, mount NFS storage, and install some packages.
Any users are responsible for modifying the variables in the script as they're unique to each deployment.

**update-single-host.yaml:**

This Ansible playbook modifies the configuration to only use the free repositories for ProxMox. Them it fetches and applies any updates. If a reboot is required, it will reboot the host. The kernel version is printed before and after the update.

**files/**

This directory is used for source files that a Ansible script may need to utilize
