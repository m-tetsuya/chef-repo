#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, Tetsuya Matsuyama
#

package "nginx" do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end


