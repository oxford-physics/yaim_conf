# Class: yaim_conf
#
# This module manages yaim_conf
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class yaim_conf ($service_type) inherits yaim_conf::params {
  
# service_type should be passed as parameter while declaring yaim_conf class and there should be a corresponding .erb file in template directory
# Currently available types are
# wn, creamce  
    $site_info = "yaim_conf/${service_type}.erb"
   package { 'glite-yaim-core' :
        ensure => installed
  }    
  
   file {'/etc/yaim/site-info.def' :
           ensure  => present,
           mode    => '0644',
           owner   => 'root',
           group   => 'root',
           content  => template("${site_info}"),
        }
  
    
  
  file { "/etc/yaim":
  source => "puppet:///modules/yaim_conf/yaim-conf-emi",
  recurse => true,
  owner   => 'root',
  group   => 'root',
  mode    => '0640',
  }
}
