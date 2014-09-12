require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

require 'beaker-rspec'

hosts.each do |host|
  install_puppet
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  puppet_module_install(:source => proj_root, :module_name => 'ntp')
  on host, puppet('module', 'install', 'puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
  shell('yum -y install git')
  shell('echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config')
  shell('cd /etc/puppet/modules/ && git clone https://github.com/ghoneycutt/puppet-module-common.git common')
end

RSpec.configure do |c|

  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
#    puppet_module_install(:source => proj_root, :module_name => 'ntp')
#    copy_module_to(:source => proj_root, :module_name => 'ntp')
#    copy_module_to(:module_name => 'ntp')
#    copy_module_to()
#    install_puppet

    hosts.each do |host|
      # Needed for the consul module to download the binary per the modulefile
#      on host, puppet('module', 'install', 'puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
#      on host, puppet('module', 'install', 'nanliu/staging'), { :acceptable_exit_codes => [0,1] }
    end
  end
end

