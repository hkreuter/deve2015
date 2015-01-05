# == Class: sources::base
#
# install sources
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

class sources::apache2php {

  $ppa        = hiera(sources::apache2php::pparepository, '')
  $signingkey = hiera(sources::apache2php::ppasigningkey, '')

  if ('' != $signingkey ) {
    exec { 'sources::apache2php::add-signing-key':
      command => "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $signingkey",
      path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:')
    }
  }

  if ('' != $ppa ) {

    exec { 'sources::apache2php::add-ppa':
      command => "sudo add-apt-repository -y $ppa",
      path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      notify  => Exec['apt-get-update::base::update']
    }
  }

}
