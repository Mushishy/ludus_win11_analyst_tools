# Ludus Ansible Role: Ludus Win11 Analyst Tools

A set of analyst tools to analyse attacker artifacts.

## Example Ludus Range Config

```yaml
ludus:
  - vm_name: "{{ range_id }}-analyst"
    hostname: "analyst"
    template: win11-22h2-x64-template
    vlan: 20
    ip_last_octet: 12
    roles:
      - ludus_win11_analyst_tools
```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`).

## License

GPLv3
