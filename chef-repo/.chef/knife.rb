# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "james"
client_key               "#{current_dir}/james.pem"
# To get this working, modify C:\Windows\System32\drivers\etc\hosts to set the IP address
chef_server_url          "https://chef-server.b4hracrzeqaephkcagltoeixla.dx.internal.cloudapp.net/organizations/cheflab"
cookbook_path            ["#{current_dir}/../cookbooks"]
