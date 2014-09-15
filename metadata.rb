# Encoding: utf-8
name             'goaccess'
maintainer       'Ross Timson'
maintainer_email 'ross@rosstimson.com'
license          'Apache 2.0'
description      'Installs GoAccess'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends          'apt'
depends          'yum'

%w( debian ubuntu centos amazon ).each do |os|
  supports os
end

attribute 'dtach/install_path',
          display_name: 'Prefix path',
          description: 'Installation prefix',
          default: '/usr/local'
