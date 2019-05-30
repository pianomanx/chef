#
# Cookbook:: validatepip
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'get pip' do
  command 'curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py'
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
