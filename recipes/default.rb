#
# Cookbook:: validatepip
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Get pip from Pypa
remote_file '#{Chef::Config[:file_cache_path]}/get-pip.py' do
  source 'https://bootstrap.pypa.io/get-pip.py'
end

# Install Pip for Python 2.7.5
execute 'install pip' do
  command 'python /tmp/get-pip.py'
  live_stream true
end

# Install Pip module certifi if node is redhat 
case node['platform_family']
when 'rhel'
  execute 'install certifi' do
    command 'pip install certifi'
    live_stream true
  end
end
