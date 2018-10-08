### OpsWorks for Puppet Enterprise example
#   logrotate basic conf

class profile::logrotate {
  class { '::logrotate':
    ensure => 'latest',
    config => {
      dateext  => true,
      compress => true,
    }
  }

}
