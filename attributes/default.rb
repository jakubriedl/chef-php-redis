default['php-redis']['url'] = 'https://github.com/nicolasff/phpredis/archive/master.tar.gz'
default['php-redis']['igbinary'] = true
default['php']['conf_dirs'] = ['/etc/php.d']

case platform_family
	when "rhel", "fedora"
		default['php-redis']['conf_file'] = 'redis.ini'
	when "debian"
		default['php-redis']['conf_file'] = '20-redis.ini'
end
