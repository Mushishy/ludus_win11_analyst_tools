# Ludus Ansible Role: Ludus Win11 Analyst Tools

A set of analyst tools to analyse attacker artifacts.

## Example Ludus Range Config

```yaml
ludus:
  - vm_name: "{{ range_id }}-analyst"
    hostname: "analyst"
    template: win11-22h2-x64-enterprise-template
    vlan: 20
    ip_last_octet: 12
    ram_gb: 16
    cpus: 4
    windows:
      sysprep: true
      install_additional_tools: true
      chocolatey_packages:
        - firefox 
      office_version: 2019
      office_arch: 64bit
    testing:
       snapshot: true
       block_internet: true
    roles:
      - ludus_win11_analyst_tools
    role_vars: 
        ludus_user_name: "analyst"
        ludus_user_password: "analyst"
```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`).

## License

GPLv3
