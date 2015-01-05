# == Class: php5::configure
#
# Configure php cli (php.ini)
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

class php5::configure {

  file { 'php5::configure::php_ini':
    ensure  => present,
    path    => '/etc/php5/cli/php.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    content => template("php5/php_ini.erb")
  }

}