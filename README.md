# Ansible Role: tmechen VM ([Ludus](https://ludus.cloud))

An Ansible Role that installs my tools on Windows 2019 server hosts.
Uses code from [privacy.sexy](https://privacy.sexy) to disable Defender and Tamper Protection.

## Install

```shell
# Clone Repo to current folder
git clone https://github.com/tmechen/ludus_tmechenvm.git
# Add from a local directory
ludus ansible role add -d ./ludus_tmechenvm
# Update
ludus ansible role rm ludus_tmechenvm && cd ./ludus_tmechenvm/ && git pull && cd .. && ludus ansible role add -d ludus_tmechenvm/
```

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
      sysprep: false
    roles:
      - ludus_tmechenvm
```

## License

GPLv3
