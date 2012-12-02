# Class: logstash::indexer
class logstash::indexer (
  $workers     = 1,
  $config      = 'puppet:///modules/logstash/indexer/indexer.conf',
  $web_backend = 'elasticsearch:///?local'
){
  require logstash::params

  file { '/etc/logstash/indexer.conf':
    ensure  => present,
    source  => $config,
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
