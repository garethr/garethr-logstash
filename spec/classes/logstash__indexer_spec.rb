require 'spec_helper'

describe 'logstash::indexer', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
  it { should include_class('logstash::params') }
end
