#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2013, Tetsuya Matsuyama
#

bash "install vim 7.3" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}/"
  code <<-EOH
  curl -o vim-7.3.tar.bz2  ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
  tar xvjf vim-7.3.tar.bz2
  cd vim73
  ./configure --disable-selinux --disable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-multibyte --disable-gui --with-features=huge
  make
  make install
  rm -rf vim73
  EOH
end
