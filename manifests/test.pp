# Test the PMP Integration
class pmp::test (
  String $host = 'skynetnix1.classroom.puppet.com',
  String $token = 'F7B3FB07-6E62-400B-940F-6CFB44DE850D',
  String $certificate_path = '/home/local/user/servercertificate',
  Integer $port = 7272,
  String $resource_name = 'TestResource',
  String $account_name = 'sysadmin',
  Boolean $ssl = false,
){

  $account_details = pmp::get_account_details($host, $token, $certificate_path, $port, $resource_name, $account_name, $ssl)

  notify { 'Account Details':
    message => "Account Details: ${account_details}",
  }

  $account_password = pmp::get_account_password($host, $token, $certificate_path, $port, $resource_name, $account_name, $ssl)

  notify { 'Account Password':
    message => "Account Password: ${account_password}",
  }

}
