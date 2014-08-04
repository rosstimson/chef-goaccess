goaccess Cookbook
=================

Installs [GoAccess][goaccess] from source. It will compile with the
GeoIP and UTF-8 option flags.

[GoAccess][goaccess] is an open source real-time web log analyzer and
interactive viewer that runs in a terminal in *nix systems. It provides
fast and valuable HTTP statistics for system administrators that require
a visual server report on the fly.

Requirements
============

Cookbooks
---------

On RHEL family distros, the "yum" cookbook is required for obtaining
latest build dependencies and adding the EPEL repo which is needed for
`geopip-devel`.

On Debian family distros, the "apt" cookbooks is required for obtaining
latest build dependencies.

Platforms
---------

The following platforms are supported and have been automatically tested under
[Test Kitchen][testkitchen]:

* Ubuntu 12.04
* Debian 7.4
* Centos 6.5
* Amazon Linux (2013.09.2)

Other versions of these OSs should work. Alternative Debian and RHEL
family distributions are also assumed to work. Please [report][issues]
any additional platforms you have tested so they can be added.

Usage
=====

Simply include `recipe[goaccess]` in your run_list to have
[GoAccess][goaccess] installed.

Recipes
=======

default
-------

Installs [GoAccess][goaccess] from source and includes the GeoIP and UTF-8
options.

Attributes
==========

version
-------

The version of [GoAccess][goaccess] that will be installed.

checksum
--------

sha256 checksum of the version to be installed, used for security.

prefix
------

The installation prefix path, defaults to `/usr/local`.

Development
===========

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

### Contributing

Pull requests are very welcome! Ideally create a topic branch for every
separate change you make.

This cookbook uses [ChefSpec][chefspec] for unit tests. I also use [Food
Critic][foodcritic] and [RuboCop][rubocop] to check for style issues.
When contributing it would be very helpful if you could run these via
`bundle exec spec` and `bundle exec style`.

Lastly, there are [Serverspec][serverspec] integration tests for
use with [Test Kitchen][testkitchen]. To see all of the available
integration test suites just check `bundle exec rake T` or `bundle exec
kitchen list`. It would be great if you could run these tests too, you
may however leave out the Amazon Linux test suite if you do not have
an AWS account as it runs on an EC2 instance (you will be billed for
running this).

License and Author
==================

Author:: [Ross Timson][rosstimson]
<[ross@rosstimson.com](mailto:ross@rosstimson.com)>

Copyright 2014, Ross Timson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


[rosstimson]:         https://github.com/rosstimson
[repo]:               https://github.com/rosstimson/chef-goaccess
[issues]:             https://github.com/rosstimson/chef-goaccess/issues
[goaccess]:           http://goaccess.prosoftcorp.com
[chefsepc]:           https://github.com/sethvargo/chefspec
[foodcritic]:         https://github.com/acrmp/foodcritic
[rubocop]:            https://github.com/bbatsov/rubocop
[serverspec]:         https://github.com/serverspec/serverspec
[testkitchen]:        https://github.com/test-kitchen/test-kitchen
