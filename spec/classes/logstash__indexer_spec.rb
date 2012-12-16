require 'spec_helper'

describe 'logstash::indexer', :type => :class do
  it { should include_class('logstash::params') }
end
