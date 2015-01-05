# == Class: composer::base
#
# install composer
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

class composer::base {

  $bindir   = hiera(composer::bindir, './composer')
  $filename = hiera(composer::filename, 'composer')

  if (!File["$bindir"]) {
    file { "$bindir":
      ensure  => directory,
      replace => "no",
      owner   => 'root',
      group   => 'root',
      mode    => 0775,
      recurse => true,
      notify  => Exec['composer::base::download']
    }
  }

  exec { 'composer::base::download':
    command => "sudo curl -sS https://getcomposer.org/installer | php -- --install-dir=$bindir --filename=$filename",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    creates => "$bindir/$filename",
    require => [Package['curl'],Package['php5']]
  }

  file { 'composer::base::make_executable':
    ensure  => exists,
    path    => "$bindir/$filename",
    replace => "no",
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    require => Exec['composer::base::download']
  }
}
