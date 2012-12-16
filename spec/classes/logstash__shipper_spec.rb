require 'spec_helper'

describe 'logstash::shipper', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
  it { should include_class('logstash::params') }
  it { should contain_package('java') }
end
