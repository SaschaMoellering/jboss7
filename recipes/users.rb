#
# Cookbook Name:: wildfly-cookbook
# Recipe:: users
# Author:: Sascha Moellering (sascha.moellering@gmail.com)
# Copyright 2013
#
# license Apache v2.0
#

group 'jboss' do
  gid 1011
end

user 'jboss' do
  comment 'runtime user jboss'
  uid 1011
  gid 'jboss'
  home '/home/jboss'
  supports manage_home: true
end
