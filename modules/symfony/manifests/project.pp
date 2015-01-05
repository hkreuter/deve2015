# == Class: symfony::project
#
# create new project
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

class symfony::project {

  $new = hiera(symfony::create_project, 'no')
  $projectname = hiera(symfony::project_name, 'default')

  if ( 'yes' == $new ) {

    file { "$fact_symfony_folder":
      ensure  => directory,
      replace => "no",
      owner   => 'root',
      group   => 'root',
      mode    => 0775,
      recurse => true
    }

    exec { 'symfony::project::new':
      command => "sudo test -d $fact_symfony_folder/$projectname && echo 'already installed' || sudo symfony new $projectname",
      path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      creates => "$fact_symfony_folder/$projectname",
      cwd     => "$fact_symfony_folder",
      require => File['symfony::base::make_executable'],
      notify  => Exec['apache2::restart']
    }

    #exec { 'symfony::project::chmod':
    #  command => "sudo chmod -R 777 $fact_symfony_folder/$projectname ",
    #  path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    #  require => File['symfony::base::new']
    #}
  }

}
