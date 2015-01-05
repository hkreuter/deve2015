# == Class: php5:mcrypt
#
# Install mcrypt
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

class php5::mcrypt {

  if ( 'yes' == hiera(php::mcrypt, 'no') ) {
    package { "php5-mcrypt":
      ensure  => 'latest',
      require => Exec['apt-get-update::base::update']
    }
  }
}
