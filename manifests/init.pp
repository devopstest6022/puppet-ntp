class ntp(
  String $package_name,
  String $package_ensure,
  String $config_name,
  String $config_file_mode,
  String $config_file_owner,
  String $config_file_group,
  String $config_ensure,
  Array[String]$servers,
  String $service_name,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $service_hasrestart,
  Boolean $service_hasstatus,
) {
  class { '::ntp::install':}
  -> class { '::ntp::config': }
  ~> class { '::ntp::service': } 
}
