class corosync::package {
  if $corosync::ensure == 'present' {
    $package_ensure = $corosync::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$corosync::package:
    ensure          => $package_ensure,
    provider        => 'aptbpo',
    install_options => { '-t' => 'squeeze-backports' },
  }
}
