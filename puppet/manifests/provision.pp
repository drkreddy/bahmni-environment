import "configurations/node-configuration"
import "configurations/stack-installers-configuration"
import "configurations/stack-runtime-configuration"
import "configurations/deployment-configuration"

node default {
	include yum-repo
	include host
	include tools
 	include java
	include mysql
	include mysqlserver
	class {users : userName => "${bahmni_user}", password_hash => "${bahmni_user_password_hash}"}
	include tomcat
	include httpd
	class { jasperserver: require => Class["tomcat"] }
 	include python
 	include postgresql
	class { openerp: require => Class["python", "postgresql"] }
	include nagios
	include bahmni-nagios
}