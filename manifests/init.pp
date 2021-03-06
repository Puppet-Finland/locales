#
# == Class: locales
#
# Generate locales.
#
# This class currently supports Debian and Ubuntu.
#
# == Parameters
#
# [*manage*]
#   Whether to manage locales with Puppet or not. Valid values are true
#   (default) and false.
# [*locales*]
#   An array of locale lines to generate. Look at the "Examples" section to get 
#   the idea. Defaults to ['en_US.UTF-8 UTF-8'].
#
# == Examples
#
#   class { 'locales':
#       locales => ['en_US.UTF-8 UTF-8',
#                   'fi_FI.UTF-8 UTF-8',
#                   'it_IT.UTF-8 UTF-8'],
#   }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class locales
(
    Boolean $manage = true,
            $locales = ['en_US.UTF-8 UTF-8']
)
{

if $manage {

    # We can use the same basic logic for all(?) Debian derivatives
    if $::osfamily == 'Debian' {
        class { '::locales::config':
            locales => $locales,
        }
    }
}
}
