# Test the PMP Integration
class pmp::test (
  String $host = '<PMP Server FQDN>',
  String $token = '<PMP API Token>',
  String $certificate_path = '<full path to PHP host certificate>',
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
