#
# Cookbook Name:: jenkins_integration
# Recipe:: ironfan_ci
#
# Copyright 2012, Infochimps, Inc.
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

ci_path = node[:jenkins_integration][:ironfan_ci][:path]
[ ci_path, ci_path + '/workspace' ].each do |dir|
  directory dir do
    owner node[:jenkins_integration][:user]
    group node[:jenkins_integration][:group]
  end
end

ironfan_homebase node[:jenkins_integration][:ironfan_ci][:name] do
  base_path     "#{ci_path}/workspace/"
  repository    node[:jenkins_integration][:ironfan_ci][:repository]
  git_keys      node[:jenkins_integration][:ironfan_ci][:git_keys]
end