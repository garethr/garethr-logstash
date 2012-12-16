# Class: logstash::shipper
class logstash::shipper (
  $workers = 1,
  $config  = 'puppet:///modules/logstash/shipper/shipper.conf',
) {
  require logstash::params
  $web_backend = undef
  $conf = '/etc/logstash/indexer.conf'

  file { '/etc/logstash/shipper.conf':
    ensure  => present,
    source  => $config,
    require => File[$logstash::params::etc_dir];
  }

  file { '/etc/init.d/logstash-shipper':
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
    content => template('logstash/logstash-init.erb')
  }

  service { 'logstash-shipper':
    ensure    => running,
    subscribe => [
      File['/etc/init.d/logstash-shipper'],
      File['/etc/logstash/shipper.conf'],
    ]
  }

}
