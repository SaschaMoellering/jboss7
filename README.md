= DESCRIPTION:
Wildfly 8 cookbook

(Based on JBoss 7 Cookbook from Bryan W. Berry https://github.com/bryanwb/chef-jboss)

This is a very simple cookbook. It only installs the jboss, configures
the system V init script to run in standalone mode

The default recipe installs 

= REQUIREMENTS:

java 1.7

= ATTRIBUTES:

* default['jboss']['home']  default location for jboss
* default['jboss']['version'] default version to download
* default['jboss']['url'] download url
* default['jboss']['user'] default jboss user


= USAGE:

Accept 

Author: Sascha Moellering <sascha.moellering@gmail.com>
Copyright: 2013 
License: Apache v2.0