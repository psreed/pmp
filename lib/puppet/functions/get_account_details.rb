#gem 'PasswordManagerPro_Gem'
#require 'PasswordManagerPro_Gem'
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
    def gc(pmp_host,pmp_token)
        gemData = PasswordManagerProGem.new(host,token,path,port)
        result = gemData.getAccountDetails(resource,account)
    end
    result
end