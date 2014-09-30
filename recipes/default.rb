remote_file "#{Chef::Config[:file_cache_path]}/phpredis.tar.gz" do
  source "#{node['php-redis']['url']}"
end

bash 'make & install phpredis' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar zxf phpredis.tar.gz
  cd phpredis-master
  phpize
  ./configure #{node['php-redis']['igbinary'] ? '--enable-redis-igbinary' : ''}
  make && make install
  EOF
end

node['php-redis']['conf_dirs'].each do |conf_dir|
	file "#{conf_dir}/#{node['php-redis']['conf_file']}" do
		owner 'root'
		group 'root'
		mode '0644'
		content 'extension=redis.so'
	end
end