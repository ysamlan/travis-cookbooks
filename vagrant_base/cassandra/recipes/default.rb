#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2011, Travis CI Development Team
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

include_recipe "java"

apt_repository "ASF-Cassandra" do
  uri          "http://www.apache.org/dist/cassandra/debian"
  distribution "10x"
  keyserver    "pgp.mit.edu"
  key          "F758CE318D77295D"

  components ["main"]
  action :add
end

# ASF apt repo uses two keys
apt_repository "ASF-Cassandra-extra-key" do
  uri          "http://www.apache.org/dist/cassandra/debian"
  distribution "10x"
  keyserver    "pgp.mit.edu"
  key          "2B5C1B00"

  components ["main"]
  action :add
end

package "cassandra" do
  action :install
end
