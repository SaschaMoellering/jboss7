require 'spec_helper'

# http://serverspec.org/resource_types.html
#
describe file('/etc/init.d/jboss') do
  it { should be_file }
end

describe file('/usr/local/jboss-8.0.0') do
  it { should be_directory }
  it { should be_grouped_into 'jboss' }
  it { should be_owned_by 'jboss' }
end
