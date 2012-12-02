require 'spec_helper'

describe 'logstash::shipper', :type => :class do

  it { should include_class('logstash::params') }

  it { should contain_logstash__initscript('logstash-shipper')}
  it { should contain_logstash__service('logstash-shipper') }
end
