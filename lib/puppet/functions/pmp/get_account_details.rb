gem 'PasswordManagerPro_Gem'
require 'PasswordManagerPro_Gem'
#gemData = PasswordManagerProGem.new("localhost","060CCDB8-71A0-4B8B-AC57-XXXXX","/home/local/user/servercertificate")

Puppet::Functions.create_function(:'pmp::get_account_details') do
    dispatch :gc do
        param 'String',  :host
        param 'String',  :token
        param 'String',  :path
        param 'Integer', :port
        param 'String',  :resource
        param 'String',  :account
    end

    result = {}
    def gc(host,token,path,port,resource,account)

        gemData = PasswordManagerProGem.new(host,token,path,port)
        result = gemData.getAccountPassword(resource,account)
#        result = {"RESOURCE_ID":1,"RESOURCE_NAME":"Windows","RESOURCE_DESCRIPTION":"","OPERATINGSYSTEM":"Windows","DNSNAME":"","DEPARTMENT":"","LOCATION":"","RESOURCE_URL":""}
    end
    result
end
