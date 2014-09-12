require 'spec_helper_acceptance'

#describe 'ntp class', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
describe 'ntp class' do
  context 'default parameters' do
    pp = <<-EOS
      class { 'ntp': }
    EOS

    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end
end
