# == Class: apt-get-install::base
#
# run apt-get install [whatever you want installed]
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

class apt-get-install::base {

  $to_be_installed = hiera(apt::install, '')

  if ('' != $to_be_installed) {
    exec { "apt-get-install::base::install":
      command => "sudo apt-get -y install $to_be_installed",
      path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      require => Exec['apt-get-update::base::update']
    }
  }

  exec { "apt-get-install::base::install-puppetlabs-apt":
    command => "sudo puppet module install puppetlabs-apt",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
  }
}
