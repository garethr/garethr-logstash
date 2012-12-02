# Class: logstash::indexer
class logstash::indexer (
  $workers = 1,
){
  require logstash::params

  file { '/etc/logstash/indexer.conf':
    ensure  => present,
    source  => 'puppet:///modules/logstash/indexer/indexer.conf',
    require => File[$logstash::params::etc_dir];
  }

  logstash::initscript { 'logstash-indexer':
    ensure  => present,
    config  => '/etc/logstash/indexer.conf',
    workers => $workers,
  }

  logstash::service { 'logstash-indexer':
    ensure => running,
  }
}
