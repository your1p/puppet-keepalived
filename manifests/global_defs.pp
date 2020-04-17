# @summary
#   Class keepalived::global_defs
#
# @param notification_email
#   Array of notification email Recipients.
#   Default: undef.
#
# @param notification_email_from
#   Define the notification email Sender.
#   Default: undef.
#
# @param smtp_server
#   Define the smtp server addres.
#   Default: undef.
#
# @param smtp_connect_timeout
#   Define the smtp connect timeout.
#   Default: undef.
#
# @param router_id
#   Define the router ID.
#   Default: undef.
#
# @param script_user
#   Set the global script_user option.
#   Default: undef.
#
# @param enable_script_security
#   Set the enable_script_security option.
#   Default: undef.
#
# @param snmp_socket
#   Define snmp master agent socker
#   Default: unix:/var/agentx/master
#
# @param enable_snmp_keepalived
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param enable_snmp_checker
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param enable_snmp_rfc
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param enable_snmp_rfcv2
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param enable_snmp_rfcv3
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param enable_traps
#   Set enable_snmp_keepalived option.
#   Default: undef.
#
# @param vrrp_higher_prio_send_advert
#   Set vrrp_higher_prio_send_advert option.
#   Default: undef.
#
# @param vrrp_garp_lower_prio_repeat
#   Set vrrp_garp_lower_prio_repeat option.
#   Default: undef.
#
class keepalived::global_defs(
  $notification_email                             = undef,
  $notification_email_from                        = undef,
  $smtp_server                                    = undef,
  $smtp_connect_timeout                           = undef,
  $router_id                                      = undef,
  $script_user                                    = undef,
  $enable_script_security                         = undef,
  $enable_snmp_keepalived                         = undef,
  $enable_snmp_checker                            = undef,
  $enable_snmp_rfc                                = undef,
  $enable_snmp_rfcv2                              = undef,
  $enable_snmp_rfcv3                              = undef,
  $enable_traps                                   = undef,
  Optional[Boolean] $vrrp_higher_prio_send_advert = undef,
  Optional[Integer] $vrrp_garp_lower_prio_repeat  = undef,
  $snmp_socket                                    = 'unix:/var/agentx/master',
) inherits keepalived::params {
  concat::fragment { 'keepalived.conf_globaldefs':
    target  => "${keepalived::params::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => '010',
  }
}
