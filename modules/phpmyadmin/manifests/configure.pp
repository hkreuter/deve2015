# == Class: phpmyadmin::configure
#
# configure phpmyadmin
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

class phpmyadmin::configure {

    exec { 'phpmyadmin::configure::link-enabled':
           command => "sudo ln -sf /etc/phpmyadmin/apache.conf /etc/apache2/sites-enabled/001-phpmyadmin",
           path     => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
           require  => [Package['apache2'],Service['apache2']],
           notify   => Exec['apache2::restart']
    }

}
