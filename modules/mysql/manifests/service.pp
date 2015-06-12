class mysql::service (
  enabled,
  ensure,
){
  service { 'csmysql5':
    ensure     => $ensure,
    hasstatus  => true,
    hasrestart => true,
    enabled    => $enabled,
    require    => Class['mysql::config'],
  }
}
