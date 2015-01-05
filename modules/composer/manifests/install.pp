# == Class: composer::install
#
# run composer install
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

class composer::install {

  $installdir  = $composer::base::bindir
  $composer    = $composer::base::filename
  $run_install = hiera(composer::run_install, "no")
  $run_update  = hiera(composer::run_update, "no")

  if (     ( 'yes' == $run_install )
       and ( $fact_composer_targetdir )
     ) {

    file { "$fact_composer_targetdir":
      ensure  => directory,
      replace => "no",
      owner   => 'root',
      group   => 'root',
      mode    => 0775,
      recurse => true
    }

    exec { 'composer::base::install':
      command     => "$composer install",
      path        => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      cwd         => $fact_composer_targetdir,
      environment => "COMPOSER_HOME=/home/vagrant/.composer",
      require     => [Exec['composer::base::download'],
        File['composer::base::make_executable'],
        File["$fact_composer_targetdir"]]
    }

    if ('yes' == $run_update) {

      exec { 'composer::base::update':
        command     => "$composer update",
        path        => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
        cwd         => $fact_composer_targetdir,
        environment => "COMPOSER_HOME=/home/vagrant/.composer",
        require     => [Exec['composer::base::download'],
          File['composer::base::make_executable'],
          File["$fact_composer_targetdir"]]
      }
    }
  }
}
