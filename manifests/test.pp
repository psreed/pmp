# Test the PMP Integration
class pmp::test (
  String $certificate_path = '',
  String $resource_name = 'TestResource',
  String $account_name = 'sysadmin',
  String $host = 'skynetnix1.classroom.puppet.com',
  String $token = 'F7B3FB07-6E62-400B-940F-6CFB44DE850D',
  Integer $port = 7272,
){
  notify { 'testing': }

  notify { 'Structured Data':
    message => pmp::get_account_details($host, $token, $certificate_path, $port, $resource_name, $account_name)
  }

}
