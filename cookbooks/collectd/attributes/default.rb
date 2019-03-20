default["collectd"]["version"]            = "5.1.1"
if node["platform_family"] == 'rhel'
  default["collectd"]["dir"]              = "/etc/collectd.d"
else
  default["collectd"]["dir"]              = "/etc/collectd"
end
default["collectd"]["basedir"]            = "/var/lib/collectd"
default["collectd"]["plugindir"]          = "/usr/lib/collectd"
default["collectd"]["typesdb"]            = "/usr/share/collectd/types.db"
default["collectd"]["url"]                = "http://collectd.org/files/collectd-#{node["collectd"]["version"]}.tar.gz"
default["collectd"]["checksum"]           = "cb361deeda00bece54cec2f7a2c368ccea4ac1c4a83388a0dae0435ba8969ee1"
default["collectd"]["interval"]           = 10
default["collectd"]["read_threads"]       = 5
default["collectd"]["name"]               = node["fqdn"]
default["collectd"]["plugins"]            = Mash.new
default["collectd"]["graphite_role"]      = "graphite"
default["collectd"]["graphite_ipaddress"] = ""
