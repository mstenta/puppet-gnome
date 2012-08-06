class gnome {

  # Add the Gnome repository to APT.
  exec { 'Gnome repo':
    command => 'add-apt-repository ppa:gnome3-team/gnome3',
    path => '/usr/bin',
    notify => Exec['apt-get update'],
  }

  # Install Gnome.
  package { 'gnome-shell':
    ensure => present,
    require => [ Exec['Gnome repo'], Exec['apt-get update'] ],
  }
}
