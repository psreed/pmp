# Adapted from https://www.manageengine.com/products/passwordmanagerpro/help/chef-and-puppet.html#sampleaccdetails
gem 'PasswordManagerPro_Gem'
require 'PasswordManagerPro_Gem'

Puppet::Functions.create_function(:'pmp::get_account_details') do
    dispatch :gc do
        param 'String',  :host
        param 'String',  :token
        param 'String',  :path
        param 'Integer', :port
        param 'String',  :resource
        param 'String',  :account
        param 'Boolean', :ssl
    end

    result = {}
    def gc(host,token,path,port,resource,account,ssl)
        begin 
            gemData = PasswordManagerProGem.new(host,token,path,port)
            gemData.disable_ssl = !ssl
            result = gemData.getAccountDetails(resource,account)
        rescue => err
            result = err
        end
    end
    result
end
