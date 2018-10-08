### OpsWorks for Puppet Enterprise example for a static website
class profile::website {
  include 'nginx'

  group { 'nginx':
            ensure => 'present',
            gid    => '502',
        }

  user { 'nginx':
          ensure => 'present',
          gid    => '502',
  }

file { ['/var/www/',
        '/var/www/demo-website', ]:
        ensure => directory,
        mode   => '0755',
        owner  => 'nginx',
        group  => 'nginx',
  }

  nginx::resource::server{'localhost':
      use_default_location => false,
      www_root             => '/var/www/demo-website',
  }

  file { '/var/www/demo-website/index.html':
    ensure  => file,
    mode    => '0755',
    owner   => 'nginx',
    group   => 'nginx',
    content => template('profile/demo-website/index.html.erb'),
    require => File['/var/www/demo-website'],
  }
}
