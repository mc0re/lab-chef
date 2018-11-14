#
# Cookbook:: lab-windows
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Enable Telnet
windows_feature 'Telnet-Client' do
  action :install
end
