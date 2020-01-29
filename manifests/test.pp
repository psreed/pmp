# Test the PMP Integration
class pmp::test (
  String $certificate_path = '/home/local/user/servercertificate',
  String $resource_name = 'TestResource',
  String $account_name = 'sysadmin',
  String $host = 'skynetnix1.classroom.puppet.com',
  String $token = 'F7B3FB07-6E62-400B-940F-6CFB44DE850D',
  Integer $port = 7272,
){

  $data = pmp::get_account_details($host, $token, $certificate_path, $port, $resource_name, $account_name)

  $content = inline_template("
<%- require 'json' -%>
<%= JSON.pretty_generate(@hash) %>
")

  notice($content)

}
