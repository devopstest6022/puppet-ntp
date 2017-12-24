class ntp::install(
  String $package_name   = $::ntp::package_name,
  String $package_ensure = $::ntp::package_ensure,
) {
  package { 'ntp_install':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
