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

default['goaccess']['version'] = '0.8.4'
default['goaccess']['checksum'] = '22f67dbbee05c695ce624e4664ef2274918366d2cde24784265c6f04c18a756a' # rubocop:disable LineLength
default['goaccess']['url'] = 'http://tar.goaccess.io/'
default['goaccess']['prefix'] = '/usr/local'
