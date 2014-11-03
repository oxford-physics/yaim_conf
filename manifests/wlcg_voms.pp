class yaim_conf::wlcg_voms {
   $package_list = ["wlcg-voms-alice","wlcg-voms-atlas", "wlcg-voms-cms", "wlcg-voms-lhcb", "wlcg-voms-ops"]
    package { $package_list : ensure => installed,}

}
