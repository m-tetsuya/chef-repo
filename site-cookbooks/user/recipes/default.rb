#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2013, Tetsuya Matsuyama
#

dev_user = 'tetsuya'


package "zsh" do
  action :install
end

user dev_user do
  home "/home/#{dev_user}"
  shell '/bin/zsh'
  password dev_user
  supports :manage_home => true
  action [:create, :manage]
end

directory "/home/#{dev_user}/github" do
  mode '755'
  action :create
end

git "/home/#{dev_user}/github/settings" do
  repository "git://github.com/m-tetsuya/settings.git"
  revision "master"
  action :sync
end

link "/home/#{dev_user}/.zshrc" do
  to "/home/#{dev_user}/github/settings/zsh/.zshrc" 
end

link "/home/#{dev_user}/.vimrc" do
  to "/home/#{dev_user}/github/settings/vim/.vimrc"
end

directory "/home/#{dev_user}/.vim/bundle" do
  mode '755'
  recursive true
end

git "/home/#{dev_user}/.vim/bundle/neobundle.vim.git" do
  repository "https://github.com/Shougo/neobundle.vim"
  revision "master"
  action :sync
end

bash "chown" do
  user "root"
  code <<-EOH
  chown -R #{dev_user}.#{dev_user} /home/#{dev_user} 
  EOH
end
