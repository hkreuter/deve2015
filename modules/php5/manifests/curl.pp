# == Class: php5:curl
#
# Install php extension for curl
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

class php5::curl {

  if ( 'yes' == hiera(php::curl, 'no') ) {
    package { "php5-curl":
      ensure  => 'latest',
      require => Exec['apt-get-update::base::update']
    }
  }
}
