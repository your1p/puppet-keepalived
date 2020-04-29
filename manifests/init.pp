# @summary
#   Install and configure keepalived
#
# @param sysconf_dir
#
# @param sysconf_options
#
# @param config_dir
#
# @param config_dir_mode
#
# @param config_file_mode
#
# @param config_group
#
# @param config_owner
#
# @param daemon_group
#
# @param daemon_user
#
# @param pkg_ensure
#
# @param pkg_list
#
# @param service_enable
#
# @param service_ensure
#
# @param service_hasrestart
#
# @param service_hasstatus
#
# @param service_manage
#
# @param service_name
#
# @param service_restart
#
# @param vrrp_instance
#
# @param vrrp_script
#
# @param vrrp_track_process
#
# @param vrrp_sync_group
#
# @param lvs_real_server
#
# @param lvs_virtual_server
#
class keepalived (
  String[1] $sysconf_dir     = $keepalived::params::sysconf_dir,
  String    $sysconf_options = $keepalived::params::sysconf_options,

  Stdlib::Absolutepath $config_dir       = $keepalived::params::config_dir,
  Stdlib::Filemode     $config_dir_mode  = $keepalived::params::config_dir_mode,
  Stdlib::Filemode     $config_file_mode = $keepalived::params::config_file_mode,

  String[1] $config_group = $keepalived::params::config_group,
  String[1] $config_owner = $keepalived::params::config_owner,
  String[1] $daemon_group = $keepalived::params::daemon_group,
  String[1] $daemon_user  = $keepalived::params::daemon_user,

  String[1]        $pkg_ensure = $keepalived::params::pkg_ensure,
  Array[String[1]] $pkg_list   = $keepalived::params::pkg_list,

  Boolean                 $service_enable     = $keepalived::params::service_enable,
  Stdlib::Ensure::Service $service_ensure     = $keepalived::params::service_ensure,
  Boolean                 $service_hasrestart = $keepalived::params::service_hasrestart,
  Boolean                 $service_hasstatus  = $keepalived::params::service_hasstatus,
  Boolean                 $service_manage     = $keepalived::params::service_manage,
  String[1]               $service_name       = $keepalived::params::service_name,
  Optional[String[1]]     $service_restart    = $keepalived::params::service_restart,

  Hash $vrrp_instance      = {},
  Hash $vrrp_script        = {},
  Hash $vrrp_track_process = {},
  Hash $vrrp_sync_group    = {},
  Hash $lvs_real_server    = {},
  Hash $lvs_virtual_server = {},
) inherits keepalived::params {

  contain keepalived::install
  contain keepalived::config
  contain keepalived::service

  Class['keepalived::install']
  -> Class['keepalived::config']
  -> Class['keepalived::service']
}
