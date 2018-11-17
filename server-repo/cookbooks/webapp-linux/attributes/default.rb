default['server-name'] = 'chef-lab-naygiy.westus.cloudapp.azure.com'
default['webapp-linux']['user'] = 'web_admin'
default['webapp-linux']['group'] = 'web_admin'

default['webapp-linux']['document_root'] = '/var/www/customers/public_html'
default['webapp-linux']['passwords']['secret_path'] = '/etc/chef/encrypted_data_bag_secret'

default['firewall']['allow_ssh'] = true
