#
# Cookbook Name:: shadowsocks_ng
# Recipe:: default
#
# Copyright 2018, Alexander Merkulov
#

python_package node['shadowsocks']['package'] do
  version node['shadowsocks']['version']
  only_if { min_python_version('2.7.0') }
end

template '/etc/shadowsocks.json' do
  source 'shadowsocks.json.erb'
  mode '0440'
  owner 'root'
  group 'root'
end

poise_service 'ssserver' do
  command 'ssserver -c /etc/shadowsocks.json'
  stop_signal 'SIGQUIT'
end
