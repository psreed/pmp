# @summary Install and manage Password Manager Pro
#
# This module is designed to install and manage password manager pro bits
#
# @example
#   include pmp
class pmp (
  String $linux_installer_url = 'https://www.manageengine.com/products/passwordmanagerpro/8621641/ManageEngine_PMP_64bit.bin',
){
  notify('testing')
}
