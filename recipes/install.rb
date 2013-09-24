#
# Cookbook Name:: jboss7
# Recipe:: default
# Author:: Sascha Moellering (sascha.moellering@gmail.com)
# Copyright 2013
#
# license Apache v2.0
#

jboss_home = node['jboss']['home']
jboss_path = node['jboss']['path']
jboss_user = node['jboss']['user']
tarball_name = node['jboss']['tarball']

# install sudo
#rpm_package "sudo" do
#  action :install
#end

#rpm_package "libaio1" do
#  action :install
#end

# get files
bash "put_files" do
  code <<-EOH
  sudo yum install libaio
  sudo yum update
  cd /tmp
  wget #{node['jboss']['url']}
  mkdir -p #{jboss_home}
  
  tar xvzf #{tarball_name}.tar.gz -C #{jboss_home}
  chown -R jboss:jboss #{jboss_home}
  ln -s #{jboss_home}/#{tarball_name} #{jboss_home}/#{jboss_path}
  rm -f #{tarball_name}.tar.gz
  EOH
  not_if "test -d #{jboss_home}"
end


# template init file
template "/etc/init.d/jboss" do
  source "init_deb.erb"

  mode "0755"
  owner "root"
  group "root"
end

template "#{jboss_home}/#{jboss_path}/standalone/configuration/standalone-full-ha.xml" do
  source 'standalone-full-ha.xml.erb'
  owner jboss_user
  variables({
     :s3_access_key => node[:aws][:s3][:access_key],
     :s3_secret_access_key => node[:aws][:s3][:secret_access_key],
     :s3_bucket => node[:aws][:s3][:bucket]
  })
end

template "#{jboss_home}/#{jboss_path}/welcome-content/status.txt" do
  source 'status.txt.erb'
  owner jboss_user
end

template "#{jboss_home}/#{jboss_path}/standalone/configuration/standalone.conf" do
  source 'standalone.conf.erb'
  owner jboss_user
end

template "#{jboss_home}/#{jboss_path}/bin/standalone.sh" do
  source 'standalone.sh.erb'
  owner jboss_user
end

cookbook_file "/etc/sudoers" do
  source "sudoers"
  mode "0440"
  owner "root"
  group "root"
end

# start service
service "jboss" do
  service_name "jboss"
  action [ :enable, :start ]
end

