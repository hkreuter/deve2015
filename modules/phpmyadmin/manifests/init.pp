# == Class: phpmyadmin
#
# install phpmyadmin
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

class phpmyadmin {

    contain phpmyadmin::base
    contain phpmyadmin::configure

}
