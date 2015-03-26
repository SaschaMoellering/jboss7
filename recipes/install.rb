#
# Cookbook Name:: jboss7
# Recipe:: default
# Author:: Sascha Moellering (sascha.moellering@gmail.com)
# Copyright 2014
#
# license Apache v2.0
#

jboss_home = node['jboss']['home']
jboss_user = node['jboss']['user']
jboss_version = node['jboss']['version']

include_recipe 'ark'

bash 'update' do
  code <<-EOH
  sudo yum update -y
  EOH
  not_if "test -d #{jboss_home}"
end

ark 'jboss' do
  url node['jboss']['url']
  home_dir jboss_home
  version jboss_version
  append_env_path true
  action :install
end

# template init file
template '/etc/init.d/jboss' do
  source 'init_deb.erb'

  mode '0755'
  owner 'root'
  group 'root'
end

template "#{jboss_home}/standalone/configuration/standalone-full-ha.xml" do
  source 'standalone-full-ha.xml.erb'
  owner jboss_user
  variables(
              s3_access_key:        node['aws']['s3']['access_key'],
              s3_secret_access_key: node['aws']['s3']['secret_access_key'],
              s3_bucket:            node['aws']['s3']['bucket']
  )
end

template "#{jboss_home}/welcome-content/status.txt" do
  source 'status.txt.erb'
  owner jboss_user
end

template "#{jboss_home}/standalone/configuration/standalone.conf" do
  source 'standalone.conf.erb'
  owner jboss_user
end

template "#{jboss_home}/bin/standalone.sh" do
  source 'standalone.sh.erb'
  owner jboss_user
end

cookbook_file '/etc/sudoers' do
  source 'sudoers'
  mode '0440'
  owner 'root'
  group 'root'
end

directory "#{jboss_home}/standalone/log" do
  owner 'jboss'
  group 'jboss'
  mode 00755
  action :create
end

bash 'owner' do
  code <<-EOH
  chown -R jboss:jboss /usr/local/jboss-8.0.0
  EOH
end

# enable service
service 'jboss' do
  service_name 'jboss'
  action :enable
end

# start service
service "jboss" do
    start_command 'service jboss start && sleep 15'
    action :start
end
