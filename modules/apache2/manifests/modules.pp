# == Class: apache2
#
# install apache modules
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

class apache2::modules {

  if ( 'yes' == hiera(apache2::modules::install::mod_rewrite, 'no') ) {
    $cmdrew = "sudo a2enmod rewrite"
  } else {
    $cmdrew = "sudo a2dismod rewrite"
  }

  if ( 'yes' == hiera(apache2::modules::install::mod_actions, 'no') ) {
    $cmdact = "sudo a2enmod actions"
  } else {
    $cmdact = "sudo a2dismod actions"
  }

  exec { "apache2::modules::mod_rewrite":
    command => $cmdrew,
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require => Service['apache2'],
    notify  => Exec['apache2::restart-service']
  }

  exec { "apache2::modules::mod_actions":
    command => $cmdact,
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require => Service['apache2'],
    notify  => Exec['apache2::restart-service']
  }
}
