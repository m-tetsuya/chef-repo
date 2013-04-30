#
# Cookbook Name:: npm-install
# Recipe:: default
#
# Copyright 2013, Tetsuya Matsuyama
#
%w{ coffee-script jamjs }.each {|lib|
  npm_package lib do
    action :install
  end
}

