class ntp::config(
  String $config_name       = $::ntp::config_name,
  String $config_ensure     = $::ntp::config_ensure,
  String $config_file_mode  = $::ntp::config_file_mode,
  String $config_file_owner = $::ntp::config_file_owner,
  String $config_file_group = $::ntp::config_file_group,
  Array[String] $servers    = $::ntp::servers,
) {
  file { 'ntp_config':
    ensure  => $config_ensure,
    name    => $config_name,
    path    => "/etc/${config_name}",
    owner   => $config_file_owner,
    group   => $config_file_group,
    content => template("${module_name}/ntp.conf.erb"),
  }
}
