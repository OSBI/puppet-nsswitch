#
# init.pp
# 
# Copyright (c) 2011, OSBI Ltd. All rights reserved.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301  USA
#
class nsswitch {
    
    $nsswitch_passwd    = extlookup("nsswitch_passwd",    "files")
    $nsswitch_shadow    = extlookup("nsswitch_shadow",    "files")
    $nsswitch_group     = extlookup("nsswitch_group",     "files")
    $nsswitch_hosts     = extlookup("nsswitch_hosts",     "files dns")
    $nsswitch_bootparams= extlookup("nsswitch_bootparams","nisplus [NOTFOUND=return] files")
    $nsswitch_ethers    = extlookup("nsswitch_ethers",    "files")
    $nsswitch_netmasks  = extlookup("nsswitch_netmasks",  "files")
    $nsswitch_networks  = extlookup("nsswitch_networks",  "files")
    $nsswitch_protocols = extlookup("nsswitch_protocols", "files")
    $nsswitch_rpc       = extlookup("nsswitch_rpc",       "files")
    $nsswitch_services  = extlookup("nsswitch_services",  "files")
    $nsswitch_netgroup  = extlookup("nsswitch_netgroup",  "nisplus")
    $nsswitch_publickey = extlookup("nsswitch_publickey", "nisplus")
    $nsswitch_automount = extlookup("nsswitch_automount", "files nisplus")
    $nsswitch_aliases   = extlookup("nsswitch_aliases",   "files nisplus")
    
    file { "/etc/nsswitch.conf":
        ensure  => present,
        content => template("nsswitch/nsswitch.conf.erb"),
        mode => 0644
    }
    
}

