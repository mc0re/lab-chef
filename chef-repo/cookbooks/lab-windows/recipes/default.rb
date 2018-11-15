#
# Cookbook:: lab-windows
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Enable Telnet, this is PS feature name
windows_feature_powershell 'Telnet-Client' do
  action :install
  all true
end
