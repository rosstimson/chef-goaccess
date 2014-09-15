# Encoding: utf-8
#
# Cookbook Name:: goaccess
# Recipe:: default
#
# Copyright 2014, Ross Timson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Installation of build dependencies may fail unless package index files are
# up to date.  Also, CentOS needs EPEL repo to install GeoIP-devel.
case node['platform_family']
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
end

# Add the EPEL repo for CentOS, Amazon Linux already has extra repos
if platform?('centos')
  yum_repository 'epel' do
    description 'Extra Packages for Enterprise Linux'
    mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
    gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
    action :create
  end
end

packages = case node['platform_family']
           when 'rhel'
             %w( gcc make autoconf libtool gettext ncurses-devel glib2-devel
                 geoip-devel )
           else
             %w( gcc make autoconf libtool gettext libncurses5-dev
                 libncursesw5-dev libglib2.0-dev libgeoip-dev )
           end

packages.each do |name|
  package name
end

tar_name = "goaccess-#{node['goaccess']['version']}"
remote_file 'goaccess' do
  path "#{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz"
  source "#{node['goaccess']['url']}/#{tar_name}.tar.gz"
  checksum node['goaccess']['checksum']
  notifies :run, 'bash[install_goaccess]', :immediately
end

bash 'install_goaccess' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOH
      tar -zxf #{tar_name}.tar.gz
      cd #{tar_name}
      ./configure --prefix #{node['goaccess']['prefix']} --enable-geoip --enable-utf8
      make
      make install
      chown root:root #{node['goaccess']['prefix']}/bin/goaccess
    EOH
  action :nothing
end
