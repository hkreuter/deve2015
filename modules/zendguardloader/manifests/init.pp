# == Class: zendguardloader
#
# puppet module for zendguardloader
# NOTE: copy file to zendguardloader/files before provisioning
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

class zendguardloader {

  contain zendguardloader::base
  contain zendguardloader::configure

}
