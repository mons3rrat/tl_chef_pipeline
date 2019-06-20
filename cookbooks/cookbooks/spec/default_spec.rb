require 'spec_helper'

describe 'monit::default' do
  context 'When all atributes are default, on Ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu').converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run
    end

    it 'creates a cookbook_file with attributes' do
      expect(chef_run).to create_cookbook_file('/etc/default/monit').with(
        source: 'monit.default',
        user:   'root',
        group:  'root',
        mode:   0644
      )
      expect(chef_run).to_not create_cookbook_file_if_missing('/etc/default/monit').with(
        user:   'bacon',
        group:  'fat'
      )
    end
  
    it 'enables a monit service' do
      expect(chef_run).to enable_service('monit')
      expect(chef_run).to_not enable_service('another_service')
    end
  
    it 'starts monit service' do
      expect(chef_run).to start_service('monit')
      expect(chef_run).to_not start_service('another_service')
    end
        
    it 'installs a monit with the default action' do
      expect(chef_run).to install_package('monit')
    end

    it 'creates a directory with the default action' do
      expect(chef_run).to create_directory('/etc/monit/conf.d/').with(
        user:   'root',
        group:  'root',
        mode:   0755,
        recursive: true
      )
      expect(chef_run).to_not create_directory('/etc/monit/conf/').with(
        user:   'bacon',
        group:  'fat'
      )
    end

    it 'creates a template with attributes' do
      expect(chef_run).to create_template('/etc/monit/monitrc').with(
        user:   'root',
        group:  'root',
        mode:   0700,
        source: 'monitrc.erb'
      )
      expect(chef_run).to_not create_template('/etc/monit/not_monitrc').with(
        user:   'bacon',
        group:  'fat',
        backup: true
      )
    end
  end
end