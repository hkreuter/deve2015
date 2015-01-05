# == Class: php5:mysql
#
# Install php extension for mysql
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

class php5::mysql {

  if ( 'yes' == hiera(php::mysql, 'no') ) {
    package { "php5-mysql":
      ensure  => 'latest',
      require => Exec['apt-get-update::base::update']
    }
  }
}
