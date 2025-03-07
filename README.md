# Ansible Role: tmechen VM ([Ludus](https://ludus.cloud))

An Ansible Role that installs my tools on Windows 2019 server hosts.
Uses code from [privacy.sexy](https://privacy.sexy) to disable Defender and Tamper Protection.

## Role Variables

## Dependencies

None.

## Known issues

## Example Ludus Range Config

```yaml
ludus:
  - vm_name: "{{ range_id }}-tmechenVM"
    hostname: "{{ range_id }}-TMECHEN-VM"
    template: win2019-server-x64-template
    vlan: 100
    ip_last_octet: 100
    ram_gb: 8
    cpus: 8
    windows:
      install_additional_tools: true
    roles:
      - tmechen.ludus_tmechenvm
```

## License

GPLv3
