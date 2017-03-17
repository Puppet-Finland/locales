#
# == Class: locales::config
#
# Generate locales based on a locales files
#
class locales::config
(
    Array[String] $locales

) inherits locales::params
{

    include ::locales::params

    file { 'locales-list':
        ensure  => present,
        name    => $::locales::params::locales_file,
        content => template('locales/locales.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
    }

    exec { 'locales-generate':
        # On Debian dpkg-reconfigure will always trigger a locale generation, so 
        # we use locale-gen directly instead.
        command     => $::locales::params::generate_command,
        path        => [ '/sbin', '/bin', '/usr/sbin', '/usr/bin' ],
        refreshonly => true,
        require     => File['locales-list'],
        subscribe   => File['locales-list'],
        logoutput   => 'on_failure',
    }
}
