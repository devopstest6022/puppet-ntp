function ntp::data {
  $base_params = {
    'ntp::package_name' => 'ntp',
    'ntp::package_ensure' => 'present', 
    'ntp::config_name' => 'ntp.conf', 
    'ntp::config_ensure' => 'file',
    'ntp::config_file_owner' => 'root',
    'ntp::config_file_group' => 'root',
    'ntp::config_file_mode' => '0664',
    'ntp::servers' => ['paka.0', 'paka.1'],
    'ntp::service_ensure' => 'running',
    'ntp::service_enable' => true,
    'ntp::service_hasrestart' => true,
    'ntp::service_hasstatus' => true ,
  }
  case $facts['os']['family'] {
    'RedHat': {
      $os_params = {
        'ntp::service_name' => 'ntpd',
      }
    }
    'Debian': {
      $os_params = {
        'ntp::service_name' => 'ntp',
      }
    }
    default: { 
      fail("${facts['operatingsystem']} is not supported")
    }
  }
  $base_params + $os_params
}
