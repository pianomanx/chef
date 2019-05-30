#
# Cookbook:: validatepip
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

yum_package 'wget' do
  action :install
end

execute 'get pip' do
  command 'wget https://bootstrap.pypa.io/get-pip.py'
end

execute 'install pip' do
  command 'python get-pip.py'
  live_stream true
end

case node['platform_family']
when 'rhel'
  execute 'install certifi' do
    command 'pip install certifi'
    live_stream true
  end
end
