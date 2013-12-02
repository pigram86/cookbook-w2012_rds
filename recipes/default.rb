#
# Cookbook Name:: w2012_rds
# Recipe:: default
#
# Copyright (C) 2013 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# install xps
windows_feature node[:w2012][:xps] do
  action :install
  not_if {reboot_pending?}
end

# install RDS 
windows_feature node[:w2012][:rds] do
  action :install
  not_if {reboot_pending?}
end

#install appserver
windows_feature node[:w2012][:appsrv] do
  action :install
  not_if {reboot_pending?}
end

# install desktop experience
windows_feature node[:w2012][:deskexp] do
  action :install
  not_if {reboot_pending?}
end


# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'reboot needed'
  only_if {reboot_pending?}
end 