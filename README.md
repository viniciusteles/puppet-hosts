# Manage `/etc/hosts` file.

## Description
This module manages `/etc/hosts` from a template. You can also use it to add host entries.

## Parameters

- host_ip
- host_name
- host_fqdn - the host's fully qualified domain name
- hosts_entries - a list of hosts entries as shown below

## Usage

### hosts
Replace `/etc/hosts` with the template file

    include hosts

Replace `/etc/hosts` with the template file, configured with parameters

    class { 'hosts':
        host_ip       => '192.168.170.120',
        host_name     => 'myserver',
        host_fqdn     => 'myserver.mydomain.com',
        hosts_entries => [
          "192.168.170.169 anotherdomain.com",
          "192.168.170.170 exampledomain.com"
        ]
    }

## Authors

[Vinícius Teles](https://github.com/viniciusteles)

## Acknowledgement

Thanks to [Dennis Hoppe](https://github.com/dhoppe) for several ideas extracted from [his own Hosts Puppet module](https://github.com/dhoppe/puppet-hosts).


## License

This Puppet module is released under the MIT license:

* http://opensource.org/licenses/MIT
