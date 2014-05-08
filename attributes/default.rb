#
# Cookbook Name:: jboss7
# Attributes:: default
# Author:: Sascha Moellering

default['jboss']['home'] = '/srv/jboss'
default['jboss']['path'] = 'wildfly-8.0.0.CR1'
default['jboss']['version'] = '8.0.0'
default['jboss']['url'] = 'http://download.jboss.org/wildfly/8.0.0.CR1/wildfly-8.0.0.CR1.zip'
default['jboss']['tarball'] = 'wildfly-8.0.0.CR1.zip'
default['jboss']['user'] = 'jboss'
default['jboss']['application'] = 'jboss'
default['jboss']['config'] = 'standalone'
default['jboss']['script'] = 'standalone.sh'
default['jboss']['manage_config_file'] = true

node.override['java']['jdk_version'] = '7'
node.override['java']['install_flavor'] = 'oracle'
node.override['java']['oracle']['accept_oracle_download_terms'] = true

default['aws']['s3']['access_key'] = ''
default['aws']['s3']['secret_access_key'] = ''
default['aws']['s3']['bucket'] = ''
