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

default['goaccess']['version'] = '0.8.5'
default['goaccess']['checksum'] = 'a4c6b6b98875059409b2a7528d5e7662536591b1949461cb03d88ea1360c3a88' # rubocop:disable LineLength
default['goaccess']['url'] = 'http://tar.goaccess.io/'
default['goaccess']['prefix'] = '/usr/local'
