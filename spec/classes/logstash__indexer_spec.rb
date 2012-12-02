require 'spec_helper'

describe 'logstash::indexer', :type => :class do

  it { should include_class('logstash::params') }

  it { should contain_logstash__initscript('logstash-indexer')}
  it { should contain_logstash__service('logstash-indexer') }

end
