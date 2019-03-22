if node["platform_family"] == 'rhel'
  config_file = "/etc/collectd.conf"
else
  config_file = "#{node["collectd"]["dir"]}/collectd.conf"
end

Chef::Log.fatal("Collecd_config_file: #{config_file} ..")



template config_file do
  mode "0644"
  source "collectd.conf.erb"
  variables(
    :name         => node["collectd"]["name"],
    :dir          => node["collectd"]["dir"],
    :basedir      => node["collectd"]["basedir"],
    :plugindir    => node["collectd"]["plugindir"],
    :typesdb      => node["collectd"]["typesdb"],
    :interval     => node["collectd"]["interval"],
    :read_threads => node["collectd"]["read_threads"],
    :plugins      => node["collectd"]["plugins"]
  )
  notifies :restart, "service[collectd]"
end

directory "#{node["collectd"]["dir"]}/conf.d" do
  action :create
end

directory "#{node["collectd"]["dir"]}/xconf.d" do
  action :create
end
