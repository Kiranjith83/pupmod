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

  nginx::resource::server{'localhost':
      use_default_location => false,
      www_root             => '/var/www/demo-website',
  }


  file { [ '/var/www',
    '/var/www/demo-website', ]:
    ensure  => directory,
    recurse => true,
    mode    => '0755',
    owner   => 'nginx',
    group   => 'nginx',
    content => template('profile/demo-website/index.html.erb'),
  }
}
