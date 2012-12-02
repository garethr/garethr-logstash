# Class: logstash::shipper
class logstash::shipper (
  $workers = 1
){
  require logstash::params

  file { '/etc/logstash/shipper.conf':
    ensure  => present,
    source  => 'puppet:///modules/logstash/shipper/shipper.conf',
    require => File[$logstash::params::etc_dir];
  }

  logstash::initscript { 'logstash-shipper':
    ensure  => present,
    workers => $workers,
    config  => '/etc/logstash/shipper.conf',
  }

  logstash::service { 'logstash-shipper':
    ensure => running,
  }

}
