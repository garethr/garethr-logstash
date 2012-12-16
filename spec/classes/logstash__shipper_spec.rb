require 'spec_helper'

describe 'logstash::shipper', :type => :class do
  it { should include_class('logstash::params') }
end
