class corosync::service {
  service {$corosync::service_name:
    ensure     => $corosync::service_ensure,
    enable     => $corosync::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
  if $::operatingsystem == 'Debian' {
    if $corosync::service_enable == true {
      exec{$name:
        path    => '/bin:',
        command => "sed -i -e 's/START=no/START=yes/' /etc/default/${corosync::service_name}",
        onlyif  => "grep -i \"START=no\" /etc/default/${corosync::service_name}",
      }
    } else {
      exec{$name:
        path    => '/bin:',
        command => "sed -i -e 's/START=yes/START=no/' /etc/default/${corosync::service_name}",
        onlyif  => "grep -i \"START=yes\" /etc/default/${corosync::service_name}",
      }
    }
  }
}
