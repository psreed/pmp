# pmp

This unfinished Puppet module proves out the concept of ManageEngine Password Manager Pro (PMP) Integration with Puppet.

It is adapted from the code proveded by ManageEngine here: 
https://www.manageengine.com/products/passwordmanagerpro/help/chef-and-puppet.html

The important bits are:

- The Puppet Master Gem Installation Task (/tasks/install_gem_on_master.sh)
   - This task will automate the installation of the required ruby gem on the Puppet master server.
   
- A custom ruby function wrapper for PMP Account Details (/lib/puppet/functions/pmp/get_account_details.rb)
  - This function will use the ME provided PMP ruby gem to connect to the PMP API and get Account Details.
  
- A custom ruby function wrapper for PMP Account Details (/lib/puppet/functions/pmp/get_account_password.rb)
   - This function will use the ME provided PMP ruby gem to connect to the PMP API and get a specific account password.
   
- The pmp::test class (/manifests/test.pp)
   - This illustrates how to use the above custom functions in a Puppet module/class.
