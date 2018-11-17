#
# Cookbook:: webapp-linux
# Recipe:: webserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_ssl'

# Enable prefork for PHP
apache_module 'mpm_event' do
  enable false
end

apache_module 'mpm_prefork' do
  enable true
end

service 'apache2' do
  action :restart
end

include_recipe 'apache2::mod_php'

web_app 'customers' do
  # name 'customers'
  template 'customers.conf.erb'
  enable true
  #  notifies :restart, 'httpd_service[customers]'
end

apache_site '000-default' do
  enable false
end

directory node['webapp-linux']['document_root'] do
  recursive true
end

file "#{node['webapp-linux']['document_root']}/index.php" do
  content '<html>This is a temporary page</html>'
  owner node['webapp-linux']['user']
  group node['webapp-linux']['group']
  mode '0644'
  action :create
end

firewall_rule 'http' do
  port 80
  protocol :tcp
  action :create
end

service 'apache2' do
  action :restart
end
