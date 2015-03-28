# == Class: oxideshopce::base
#
# download offical OXID eShop Community Edition package
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

class oxideshopce::base {

  $basedir  = hiera(oxideshopce::basedir)
  $unzipdir = hiera(oxideshopce::unzipdir, 'oxce')
  $filename = hiera(oxideshopce::filename, 'ce.zip')
  $url      = hiera(oxideshopce::downloadurl)

  if (!File["$basedir"]) {
    file { "$basedir":
      ensure  => directory,
      replace => "no",
      owner   => 'root',
      group   => 'root',
      mode    => 0775,
      recurse => true,
      notify  => File["$unzipdir"]
    }
  }

  file { "$unzipdir":
    ensure  => absent,
    notify  => Exec['oxideshopce::base::download']
  }

  exec { 'oxideshopce::base::download':
    command => "sudo curl -sSL $url --output $basedir/$filename",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    creates => "$basedir/$filename",
    require => [Package['curl'], File[$unzipdir]]
  }

  exec { 'oxideshopce::base::unzip':
    command => "sudo unzip -d $unzipdir $basedir/$filename",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    creates => "$unzipdir",
    require => [Exec['oxideshopce::base::download'],
                Exec['apt-get-install::base::install']]
  }

  file { "$basedir/$filename":
    ensure  => absent,
    require => [Exec['oxideshopce::base::unzip']]
  }

}
