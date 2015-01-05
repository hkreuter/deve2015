# == Class: apache2::configure
#
# puppet module for apache2
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

class apache2::configure {

  $directories    = hiera(apache2::directories)
  $ports_content  = hiera(apache2::ports_conf::content, '')
  $available      = hiera(apache2::sites_available_name, 'project')
  $enabled        = hiera(apache2::sites_enabled_linkname, '000-default')
  $apache2_vhosts = hiera(apache2::vhosts)

  file { $directories:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755
  }

  if ('' == $ports_content) {
    file { '/etc/apache2/ports.conf':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => 0775,
      source  => "puppet:///modules/apache2/default_ports.conf",
      require => File[$directories]
    }
  } else {
    file { '/etc/apache2/ports.conf':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => 0775,
      content => $ports_content,
      require => File[$directories]
    }
  }

  file { '/etc/apache2/httpd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    content => template("apache2/httpd_conf.erb"),
    require => File[$directories]
  }

  file { "/etc/apache2/sites-available/$available":
    ensure   => present,
    owner    => root,
    group    => root,
    mode     => 0775,
    content  => template('apache2/sites-available.erb'),
    require  => File[$directories]
  }

  file { "/etc/apache2/sites-enabled/$enabled":
    ensure   => absent,
    require  => File[$directories]
  }

  exec { 'apache2::configure::link-enabled':
    command  => "sudo ln -sf /etc/apache2/sites-available/$available /etc/apache2/sites-enabled/$enabled",
    path     => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require  => File["/etc/apache2/sites-available/$available"],
    notify   => Exec['apache2::restart']
  }

}
