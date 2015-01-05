# == Class: sources::pear
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

class sources::pear {

  exec { "sources::pear::install":
    command => 'sudo apt-get -y install php-pear',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['sources::pear::auto_discover']
  }

  exec { 'sources::pear::auto_discover':
    command => 'sudo pear config-set auto_discover 1',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['sources::pear::upgrade']
  }

  exec { 'sources::pear::upgrade':
    command => 'sudo pear upgrade',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    notify  => Exec['sources::pear::channels']
  }

  exec { 'sources::pear::channels':
    command => 'sudo pear update-channels',
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:')
  }

}
