# Install and configure nginx on a ubuntu 16 server

exec { 'apt-get update':
  command => 'apt-get update',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt update'],
}

exec { 'custom_header':
  command => 'sed -i \\\tadd_header X-Served-By 1574-web-01;' /etc/nginx/nginx.conf',
  path    => '/usr/bin:/usr/sbin:/sbin:/bin',
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
