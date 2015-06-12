class postfix::service {
  service { 'postfix':
    lensure    => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['postfix::config'],
  }
}
