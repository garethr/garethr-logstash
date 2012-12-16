require 'spec_helper'

describe 'logstash::indexer', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
  it { should include_class('logstash::params') }
  it { should contain_package('java') }

  context 'with a version' do
    let(:params) { {'version' => '1.0.0'} }
    it { should contain_exec('download logstash jar').with_creates("/usr/local/bin/logstash-1.0.0-monolithic.jar")}
  end
end
