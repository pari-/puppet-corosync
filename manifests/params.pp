class corosync::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  $version = '2'
  $secauth = 'off'
  $ringnumber = '0'
  $mcastport = '5405'
  $ttl = '1'
  $transport = 'udpu'
  $fileline = 'off'
  $to_logfile = 'yes'
  $to_syslog = 'yes'
  $global_debug = 'on'
  $logfile = '/var/log/corosync/corosync.log'
  $timestamp = 'on'
  $logger_subsys_hash = { 'amf' => { 'name' => 'AMF', 'debug' => 'off' } }

  case $::operatingsystem {
    'Debian': {
      $package = [ 'corosync', 'haveged' ]
      $config = '/etc/corosync/corosync.conf'
      $service_name = 'corosync'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}
