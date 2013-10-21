# Internal: Prepare your system for MySQL.
#
# Examples
#
#   include mysql::config
class mysql::config($override_port = 13306, $override_socket = false, $override_charset = latin1) {
  require boxen::config

  $configdir  = "${boxen::config::configdir}/mysql"
  $configfile = "${configdir}/my.cnf"
  $datadir    = "${boxen::config::datadir}/mysql"
  $executable = "${boxen::config::homebrewdir}/bin/mysqld_safe"
  $logdir     = "${boxen::config::logdir}/mysql"
  $logerror   = "${logdir}/error.log"
  $port       = $override_port
  $charset    = $override_charset
 
	if( $override_socket ){
	  $socket = $override_socket
	}else{
	  $socket = "${datadir}/socket"
	}
}
