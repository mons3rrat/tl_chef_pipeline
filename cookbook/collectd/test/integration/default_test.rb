describe service('collectd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

if os.family != 'redhat'
  %w(/var/lib/collectd /usr/lib/collectd).each do |path|
    describe file(path) do
      it { should be_directory }
    end
  end
end

if os.family == 'redhat' 
  describe file('/etc/collectd.d') do
    it { should be_directory }
  end 
else 
  describe file('/etc/collectd') do
    it { should be_directory }
  end
end

if os.family == 'redhat' 
  describe file('/etc/collectd.conf') do  
    it { should be_file}
    its('content') { should include 'Interval 10' }
  end
else
  describe file('/etc/collectd/collectd.conf') do 
    it { should be_file}
    its('content') { should include 'FQDNLookup true' }
    its('content') { should include 'Interval 10' }
  end
end