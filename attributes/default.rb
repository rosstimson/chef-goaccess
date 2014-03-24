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

default['goaccess']['version'] = '0.7.1'
default['goaccess']['checksum'] = '04de880ebdedde8daeec6284783bd7f4b04d9149b08deaa5588e55f24739f49b' # rubocop:disable LineLength
default['goaccess']['prefix'] = '/usr/local'
