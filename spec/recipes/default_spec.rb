require 'spec_helper'

describe 'jboss7::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_command('test -d /srv/jboss').and_return(false)
  end

  it 'should execute the users recipe' do
    expect(chef_run).to include_recipe('jboss7::users')
  end

  it 'should execute the install recipe' do
    expect(chef_run).to include_recipe('jboss7::install')
  end
end
