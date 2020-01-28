# @summary Install and manage Password Manager Pro
#
# This module is designed to install and manage password manager pro bits
#
# @example
#   include pmp
class pmp::agent (
  String $linux_agent_installer_url = '',
  String $windows_agent_installer_url = '',
){
  notify('testing')
}
