name              "collectd"
maintainer        "Mital Patel"
maintainer_email  "mpatel@shutterfly.com"
description       "Installs and configures collectd."
version           "0.3.0"
recipe            "collectd", "Installs collectd via packages"
recipe		        "collectd::source", "Installs collectd from source"
recipe            "collectd::config", "Configures collectd"
recipe            "collectd::attribute_driven", "Installs collectd plugins via node attributes"
recipe            "collectd::recompile", "Attempts to recompile collectd"

%w{ build_essential yum }.each do |d|
  depends d
end

%w{ amazon centos fedora redhat scientific ubuntu }.each do |os|
    supports os
end

