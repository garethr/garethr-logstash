require 'spec_helper'

describe 'logstash::initscript', :type => :define do
  let(:title)  { 'logstash-indexer' }
  let(:params) { { :config => '/etc/logstash/indexer.conf', :workers => 4 } }

  it { should contain_file('logstash-indexer').with_content(/-w 4/)}
end
