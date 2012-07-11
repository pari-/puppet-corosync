class corosync::config (
  $authkey,
  $member_array,
  $bindnetaddr,
  $version              = $corosync::params::version,
  $secauth              = $corosync::params::secauth,
  $ringnumber           = $corosync::params::ringnumber,
  $mcastport            = $corosync::params::mcastport,
  $ttl                  = $corosync::params::ttl,
  $transport            = $corosync::params::transport,
  $fileline             = $corosync::params::fileline,
  $to_logfile           = $corosync::params::to_logfile,
  $to_syslog            = $corosync::params::to_syslog,
  $global_debug         = $corosync::params::global_debug,
  $logfile              = $corosync::params::logfile,
  $timestamp            = $corosync::params::timestamp,
  $logger_subsys_hash   = $corosync::params::logger_subsys_hash
) inherits corosync::params {

  file {$corosync::config:
    ensure   => 'present',
    content  => template('corosync/corosync.conf.erb'),
  }

  file {'/etc/corosync/authkey':
    ensure  => present,
    source  => "puppet:///modules/corosync/${authkey}",
    mode    => '0400',
  }

  Class['corosync'] -> Class['corosync::config']
}

