#
# Cookbook Name:: jboss7
# Attributes:: default
# Author:: Sascha Moellering


default['jboss']['home'] = "/srv/jboss"
default['jboss']['path'] = "jboss-7.1.1"
default['jboss']['version'] = "7.1.1"
default['jboss']['url'] = "http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz" 
default['jboss']['tarball'] = "jboss-as-7.1.1.Final"
default['jboss']['checksum'] = "1e33096182ac7cac96089e39f7479b35"
default['jboss']['user'] = "jboss"
default['jboss']['application'] = 'jboss'
default['jboss']['config'] = 'standalone'
default['jboss']['script'] = 'standalone.sh'
default['jboss']['manage_config_file'] = true
default['aws']['s3']['access_key'] = ""
default['aws']['s3']['secret_access_key'] = ""
default['aws']['s3']['bucket'] = ""

