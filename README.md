A puppet module for managing logstash indexers and shippers

[![Build Status](https://secure.travis-ci.org/garethr/garethr-logstash.png)](http://travis-ci.org/garethr/garethr-logstash)

Also available via on the Puppet Forge at
[garethr/logstash](http://forge.puppetlabs.com/garethr/logstash)

Tested on Ubuntu 12.04 Precise but should work elsewhere.

## Usage

### Logstash indexer

To install the logstash indexer on a node, add the following to your node manifest:

    node 'node01.example.org' {
      include 'logstash::indexer'
    }

With parameters:

    node 'node01.example.org' {
      class { 'logstash::indexer':
        version => '1.1.5',
        workers => 4,
      }
    }

We default the workers to 1 but if you have lots of filters and more
than a single CPU then experimenting with this should help performance.

Until I find time to provide more ways of configuring logstash you can
just override the configuration file like so:

      class { 'logstash::indexer':
        config  => 'puppet:///path/to/config/file.conf',
      }

The default indexer configuration is really for demo purposes, it uses
the built-in elasticsearch server and automatically starts up the web
application too. You can disable that behaviour with. If you have an
elasticsearch server elsewhere you can use the web_backend parameter to
specify the connection string.
      
      class { 'logstash::indexer':
        web_backend => false,
      }

### Logstash shipper

To install the logstash shipper on a node, add the following to your node manifest:

    node 'node01.example.org' {
      include 'logstash::shipper'
    }

With parameters:

    node 'node01.example.org' {
      class { 'logstash::shipper':
        workers => 4,
        version => '1.1.5',
        config  => 'puppet:///path/to/config/file.conf',
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
