class base {
	include sudo
	include ssh
}
node 'gateway.test.local' {
	include base
}
node 'puppet.test.local' {
	include base
}
node 'mail.test.local' {
	include base
	include postfix
}
node 'db.test.local' {
	include base
	include mysql
}
node 'default' {
	include base
}
