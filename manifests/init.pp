class hosts($host_ip='UNSET',
            $host_name='UNSET',
            $host_fqdn='UNSET',
            $hosts_entries='UNSET'
) {

  # Module compatibility checks
  #
  if ! ($::operatingsystem in ['Debian', 'Ubuntu']) {
    fail("Module ${module_name} does not support ${::operatingsystem}")
  }

  if ! ($::lsbdistcodename in ['lenny', 'squeeze', 'maverick', 'natty', 'precise']) {
    fail("Module ${module_name} does not support ${::lsbdistcodename}")
  }

  # Parameters setting
  #
  if ($host_ip == 'UNSET') {
    $host_ip_param = $::ipaddress
  } else {
    $host_ip_param = $host_ip
  }

  if ($host_name == 'UNSET') {
    $host_name_param = $::hostname
  } else {
    $host_name_param = $host_name
  }
  
  if ($host_fqdn == 'UNSET') {
    $host_fqdn_param = $::fqdn
  } else {
    $host_fqdn_param = $host_fqdn
  }

  if ($hosts_entries ==  'UNSET') {
    $hosts_entries_param = [] 
  } else {
    $hosts_entries_param = $hosts_entries
  }

  file { "/etc/hosts":
    content => template("hosts/${::osfamily}/${::lsbdistcodename}/etc/hosts.erb"),
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
