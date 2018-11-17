#
# Cookbook:: motd
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template '/etc/update-motd.d/98-server-info' do
  source 'server-info.erb'
  mode '0755'
  action :create
end
