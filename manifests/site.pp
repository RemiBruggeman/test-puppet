class base {
	include sudo
	include ssh
	include puppet
}
node 'gateway.test.local' {
	include base
	#include firewall (write firewall module for iptables)
}
node 'puppet.test.local' {
	include base
	include puppet::master
}
node 'mail.test.local' {
	include base
	include postfix
}
node 'db.test.local' {
	include base
	include mysql
}
node 'web.test.local' {
	include base

	apache::vhost { 'test.local':
		port          => '80',
		docroot       => '/var/www/test.local',
		ssl           => false,
		priority      => 10,
		serveraliases => 'home.test.local',
	}
	apache::vhost { 'other.local':
		port     => '80',
		docroot  => '/var/www/other.local',
		ssl      => false,
		priority => '10',
		}
}
node 'default' {
	include base
}
