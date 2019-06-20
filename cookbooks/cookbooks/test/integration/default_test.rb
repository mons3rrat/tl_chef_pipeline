describe service('monit') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/monit/conf.d/') do
  it { should be_directory }
end
