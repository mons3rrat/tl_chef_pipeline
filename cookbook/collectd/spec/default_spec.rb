require 'spec_helper'

describe 'collectd::default' do 
    context 'When all attributes are default, on Ubuntu' do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: 'ubuntu').converge(described_recipe)
        end
        
        it 'converges successfully' do
          chef_run 
        end

        it 'enables a collectd service' do
          expect(chef_run).to enable_service('collectd')
          expect(chef_run).to_not enable_service('another_service')
        end

        it 'starts collectd service' do
          expect(chef_run).to start_service('collectd')
          expect(chef_run).to_not start_service('another_service')
        end
      
        it "installs a collectd with the default action" do
          expect(chef_run).to install_package('collectd')
        end
      end
end