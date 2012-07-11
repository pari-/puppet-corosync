class corosync (
  $ensure         = $corosync::params::ensure,
  $package        = $corosync::params::package,
  $auto_upgrade   = $corosync::params::auto_upgrade,
  $config         = $corosync::params::config,
  $service_name   = $corosync::params::service_name,
  $service_ensure = $corosync::params::service_ensure,
  $service_enable = $corosync::params::service_enable
) inherits corosync::params {

  class {'corosync::package':}
  class {'corosync::service':}

  if $ensure == 'present' {
    Class['corosync::package'] -> Class['corosync::service']
  } else {
    Class['corosync::service'] -> Class['corosync::package']
  }
}
