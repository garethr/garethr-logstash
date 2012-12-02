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
        $logstash_version = '1.0.10',
      }
      class { 'logstash::indexer':
        require => Class['logstash'],
      }
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
        $logstash_version = '1.0.10',
      }
      class { 'logstash::shipper':
        require => Class['logstash'],
      }

    }

## Other components

Components such as elasticsearch, grok or redis should be installed with their own
modules.

## Credit

This module is heavily based on
[puppet-logstash](https://github.com/pkhamre/puppet-logstash)
