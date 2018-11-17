#
# Cookbook:: webapp-linux
# Recipe:: webserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# httpd_module 'php5' do
#   instance 'customers'
# end
