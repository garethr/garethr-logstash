require 'spec_helper'

describe 'logstash::initscript', :type => :define do
  let(:title)  { 'logstash-indexer' }
  let(:params) { { :config => '/etc/logstash/indexer.conf', :workers => 4 } }

  it { should contain_file('logstash-indexer').with_content(/-w 4/)}

  context 'specifying a custom web backend' do
    let(:params) { { :config => '/etc/logstash/indexer.conf', :workers => 1, :web_backend => 'this' } }
    it { should contain_file('logstash-indexer').with_content(/-- web --backend this/)} 
  end

  context 'disable the web backend' do
    let(:params) { { :config => '/etc/logstash/indexer.conf', :workers => 1, :web_backend => false } }
    it { should_not contain_file('logstash-indexer').with_content(/-- web --backend/)}
  end
end
