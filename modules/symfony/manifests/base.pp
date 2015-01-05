# == Class: symfony::base
#
# install symfony
#
# === Parameters
#
# === Variables
#
# No variables
#
# === Examples
#
# TODO
#
# === Authors
#
# H.R. (Deve L. Oper)
#
# === Copyright
#
# Copyright 2014-2015 H.R., unless otherwise noted.
#

class symfony::base {

  $bindir   = hiera(symfony::bindir, './symfony')
  $filename = hiera(symfony::filename, 'symfony')

  if (!File["$bindir"]) {
    file { "$bindir":
      ensure  => directory,
      replace => "no",
      owner   => 'root',
      group   => 'root',
      mode    => 0775,
      recurse => true,
      notify  => Exec['symfony::base::download']
    }
  }

  exec { 'symfony::base::download':
    command => "sudo curl -LsS http://symfony.com/installer > $bindir/$filename",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    creates => "$bindir/$filename",
    require => [Package['curl'],Package['php5'], Class['composer']]
  }

  file { 'symfony::base::make_executable':
    ensure  => exists,
    path    => "$bindir/$filename",
    replace => "no",
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    require => Exec['symfony::base::download']
  }
}
