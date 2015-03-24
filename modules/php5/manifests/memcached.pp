# == Class: php5::memcached
#
# Install php5 module memcached
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

class php5::memcached {

  if ( 'yes' == hiera(php::memcached, 'no') ) {
    exec { 'php5::modules::memcached':
      command   => 'sudo pecl install memcached',
      path      => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      require   => [Package['php5'], Class['pear::base']]
    }
  }

}