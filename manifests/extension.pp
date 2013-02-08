Gnome::Extension { require => [ Class['apt'], Class['gnome'] ] }

define gnome::extension (
  $ppa
) {

  # Add the ricotz/testing repository to APT.
  apt::ppa { "ppa:${ppa}": }

  # Install extension.
  package { $name:
    ensure => present,
    require => [ Apt::Ppa["ppa:${ppa}"], Exec['apt_update'] ],
  }
}
