# @summary Install and manage Password Manager Pro
#
# This module is designed to install and manage password manager pro bits
#
# @example
#   include pmp
#lint:ignore:140chars
class pmp::server (
  String  $linux_server_installer_url = 'https://www.manageengine.com/products/passwordmanagerpro/8621641/ManageEngine_PMP_64bit.bin',
  String  $windows_server_installer_url = 'https://www.manageengine.com/products/passwordmanagerpro/8621641/ManageEngine_PMP.exe',
  String  $linux_curl_options = '-LfOkSs',
  String  $linux_curl_cmd = '/bin/curl',
  Integer $jvmxms = 0,
  Integer $jvmxmx = 0,
){

  if $facts['kernel']=='Linux' {
    file { '/root/installer.properties':
      ensure  => file,
      content => '
USER_INSTALL_DIR=/opt/ManageEngine/PMP
#Server Configuration
USER_INPUT_CONSOLE_RESULTS=\\"High availability primary server\\",\\"\\"
#Install
-fileOverwrite_/opt/ManageEngine/PMP/_ManageEngine Password Manager Pro_installation/Change ManageEngine Password Manager Pro Installation.lax=Yes
',
    }
    exec { 'PMP curl pipe bash installation':
      command => "${linux_curl_cmd} ${linux_curl_options} ${linux_server_installer_url} | /bin/sh -s -- -f /root/installer.properties -i silent",
      creates => '/opt/ManageEngine/PMP/LICENSE_AGREEMENT',
      require => File['/root/installer.properties']
    }
    notify { 'testing': message => 'Testing this out!', }
  }
}
#lint:endignore
