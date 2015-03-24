# == Class: pear::base
#
# install php-pear
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

class pear::base {

  exec { "pear::base::aptup":
    command => "sudo apt-get update -y",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['pear::base::install'],
  }

  exec { "pear::base::install":
    command => 'sudo apt-get -y --fix-missing install php-pear',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['pear::base::auto_discover']
  }

  exec { 'pear::base::auto_discover':
    command => 'sudo pear config-set auto_discover 1',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['pear::base::upgrade']
  }

  exec { 'pear::base::upgrade':
    command => 'sudo pear upgrade',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['pear::base::channels']
  }

  exec { 'pear::base::channels':
    command => 'sudo pear update-channels',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:')
  }

}
