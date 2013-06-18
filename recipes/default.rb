#
# Cookbook Name:: rotate-to-s3
# Recipe:: default
#
# Copyright 2013, Anthony Tonns
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

include_recipe "cron"

package "rotate-to-s3" do
    # twist apt-get's arm because it's an unsigned package
    options "--force-yes"
    action :install
end

template "/opt/corsis/etc/rotate-to-s3.json" do
    source "rotate-to-s3.json.erb"
    owner "root"
    group "root"
    mode 0644
    variables(
        :destination => node['rotate-to-s3']['destination'],
        :access => node['rotate-to-s3']['access'],
        :secret => node['rotate-to-s3']['secret'],
        :source => node['rotate-to-s3']['source'].to_json,
        :pidfile => node['rotate-to-s3']['pidfile']
    )
    action :create
end

cron_d "rotate-to-s3" do
    minute 0
    command "/opt/corsis/bin/rotate-to-s3.py"
    user "root"
end

service "rotate-to-s3" do
    supports :stop => true
    action :enable
end

