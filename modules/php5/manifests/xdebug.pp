# == Class: php5::xdebug
#
# Install php5 module xdebug
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

class php5::xdebug {

  exec { 'php5::xdebug::uninstall-xdebug':
    command   => 'sudo pecl uninstall xdebug',
    path      => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require   => [Package['php5'],Package['php5-dev'],Class['pear::base']],
    notify    => Class['php5::configure']
  }

  if ( 'yes' == hiera(php::xdebug, 'no') ) {

    exec { 'php5::xdebug::install':
      command   => 'sudo pecl install xdebug',
      path      => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      require   => [Package['php5'],
        Package['php5-dev'],
        Class['pear::base'],
        Exec['php5::xdebug::uninstall-xdebug']]
    }

    $target_dir = hiera(php::extension_dir)
    $cmd_test = "test -e $target_dir/xdebug.so && echo 'ok' || "
    $cmd_find = "sudo /usr/bin/find / -name 'xdebug.so' 2> /dev/null "
    $cmd_move = "xargs mv --target-directory=$target_dir"

    exec { 'php5::xdebug:move':
      command => "$cmd_test $cmd_find | $cmd_move",
      path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
      require => Exec['php5::xdebug::install']
    }

    file { 'php5::xdebug::configure':
      ensure  => present,
      path    => '/etc/php5/mods-available/xdebug.ini',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("php5/xdebug_ini.erb"),
      require => [Exec['php5::xdebug::install'],Exec['php5::xdebug:move']]
    }

    file { 'php5::xdebug::link':
      path    => '/etc/php5/conf.d/30-xdebug.ini',
      ensure  => link,
      target  => '/etc/php5/mods-available/xdebug.ini',
      require => File['php5::xdebug::configure']
    }

    file { 'php5::xdebug::cli-link':
      path    => '/etc/php5/cli/conf.d/30-xdebug.ini',
      ensure  => link,
      target  => '/etc/php5/mods-available/xdebug.ini',
      require => File['php5::xdebug::configure']
    }

    file { 'php5::xdebug::apache-link':
      path    => '/etc/php5/apache2/conf.d/30-xdebug.ini',
      ensure  => link,
      target  => '/etc/php5/mods-available/xdebug.ini',
      require => File['php5::xdebug::configure']
    }
  }
}
