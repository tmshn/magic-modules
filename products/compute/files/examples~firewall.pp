<% if false # the license inside this if block assertains to this file -%>
# Copyright 2017 Google Inc.
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
<% end -%>
<% unless name == "README.md" -%>
<%= compile 'templates/license.erb' -%>

<%= compile 'templates/autogen_notice.erb' -%>

<%= compile 'templates/puppet/examples~credential.pp.erb' -%>

<% end # name == README.md -%>
gcompute_firewall { <%= example_resource_name('test-fw-allow-ssh') -%>:
  ensure      => present,
  allowed     => [
    {
      ip_protocol => 'tcp',
      ports       => [
        '22',
      ],
    },
  ],
  target_tags => [
    'test-ssh-server',
    'staging-ssh-server',
  ],
  source_tags => [
    'test-ssh-clients',
  ],
  project     => 'google.com:graphite-playground',
  credential  => 'mycred',
}
