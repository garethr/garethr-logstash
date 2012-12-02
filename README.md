A puppet module for managing logstash indexers and shippers

[![Build Status](https://secure.travis-ci.org/garethr/garethr-logstash.png)](http://travis-ci.org/garethr/garethr-logstash)

Adding a better way to change configuration should be added.

Tested on Ubuntu 12.04 Precise but should work elsewhere.

## Usage

### Logstash indexer

To install the logstash indexer on a node, add the following to your node manifest:

    node 'node01.example.org' {
      class { 'logstash':}
      class { 'logstash::indexer':
        require => Class['logstash'],
      }
    }

With parameters:

    node 'node01.example.org' {
      class { 'logstash':
        $logstash_version = '1.1.5',
      }
      class { 'logstash::indexer':
        workers => 4,
        require => Class['logstash'],
      }
    }

We default the workers to 1 but if you have lots of filters and more
than a single CPU then experimenting with this should help performance.

Until I find time to provide more ways of configuring logstash you can
just override the configuration file like so:

      class { 'logstash::indexer':
        config  => 'puppet:///path/to/config/file.conf',
        require => Class['logstash'],
      }

### Logstash shipper

To install the logstash shipper on a node, add the following to your node manifest:

    node 'node01.example.org' {
      class { 'logstash':}
      class { 'logstash::shipper':
        require => Class['logstash'],
      }
    }

With parameters:

    node 'node01.example.org' {
      class { 'logstash':
        $logstash_version = '1.1.5',
      }
      class { 'logstash::shipper':
        workers => 4,
        config  => 'puppet:///path/to/config/file.conf',
        require => Class['logstash'],
      }

    }

## Dependencies 

This module currently has a hard coded configuration for demonstration
purposes. It requires Redis which could be installed via [this
module](https://forge.puppetlabs.com/thomasvandoren/redis). The
configuration takes input from syslog and saves it to files in
/var/log/logstash.

## Credit

This module is heavily based on work from
[puppet-logstash](https://github.com/pkhamre/puppet-logstash)
