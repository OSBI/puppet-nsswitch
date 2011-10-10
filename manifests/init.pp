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

