define logstash::service($ensure='running') {

  service { $name:
    ensure    => $ensure,
    subscribe => [
      Class['logstash'],
      Logstash::Initscript[$name],
    ],
  }

}
