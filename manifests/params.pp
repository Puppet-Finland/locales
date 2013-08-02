#
# == Class: locales::params
#
# Defines some variables based on the operating system
#
class locales::params {

    # On Debian "dpkg-reconfigure" will always trigger a locale generation 
    # whether it makes sense or not, so we use locale-gen directly instead.

    case $::operatingsystem {
        'Debian': {
            $locales_file = '/etc/locale.gen'
            $generate_command = 'locale-gen' 
        }
        'Ubuntu': {
            $locales_file = '/var/lib/locales/supported.d/local'
            $generate_command = 'dpkg-reconfigure locales' 
        }
        default: {
            $locales_file = '/etc/locale.gen'
            $generate_command = 'locale-gen' 
        }
    }
}
