# @summary Install and manage Password Manager Pro
#
# This module is designed to install and manage password manager pro bits
#
# @example
#   include pmp
class pmp::server (
  String  $linux_server_installer_url = 'https://www.manageengine.com/products/passwordmanagerpro/8621641/ManageEngine_PMP_64bit.bin',
  String  $windows_server_installer_url = 'https://www.manageengine.com/products/passwordmanagerpro/8621641/ManageEngine_PMP.exe',
  String  $linux_curl_options = '-Lf',
  String  $linux_curl_cmd = '/bin/curl',
  Integer $jvmxms = 0,
  Integer $jvmxmx = 0,
){

  if $facts['kernel']=='Linux' {
    exec { 'PMP curl pipe bash installation':
      command => "${linux_curl_cmd} ${linux_curl_options} ${linux_server_installer_url} | /bin/sh -s -- -i silent",
    }
    notify('testing')
  }
}
