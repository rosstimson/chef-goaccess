# Encoding: utf-8

require_relative 'spec_helper'

describe 'goaccess::default' do
  context 'On Debian family platforms' do
    before { stub_resources }
    before do
      Fauxhai.mock(platform: 'debian', version: '7.4')
    end

    let(:chef_run) { ChefSpec::Runner.new(platform: 'debian', version: '7.4').converge(described_recipe) } # rubocop:disable LineLength

    it 'includes apt cookbook dependency' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'installs build dependency packages' do
      expect(chef_run).to install_package('gcc')
      expect(chef_run).to install_package('make')
      expect(chef_run).to install_package('autoconf')
      expect(chef_run).to install_package('libtool')
      expect(chef_run).to install_package('gettext')
      expect(chef_run).to install_package('libncurses5-dev')
      expect(chef_run).to install_package('libncursesw5-dev')
      expect(chef_run).to install_package('libglib2.0-dev')
      expect(chef_run).to install_package('libgeoip-dev')
    end
  end

  context 'On RHEL family platforms' do
    before { stub_resources }
    before do
      Fauxhai.mock(platform: 'centos', version: '6.5')
    end

    let(:chef_run) { ChefSpec::Runner.new(platform: 'centos', version: '6.5').converge(described_recipe) } # rubocop:disable LineLength

    it 'includes yum cookbook dependency' do
      expect(chef_run).to include_recipe('yum')
    end

    it 'installs build dependency packages' do
      expect(chef_run).to install_package('gcc')
      expect(chef_run).to install_package('make')
      expect(chef_run).to install_package('autoconf')
      expect(chef_run).to install_package('libtool')
      expect(chef_run).to install_package('gettext')
      expect(chef_run).to install_package('ncurses-devel')
      expect(chef_run).to install_package('glib2-devel')
      expect(chef_run).to install_package('geoip-devel')
    end
  end

  context 'Common to all platforms' do
    before { stub_resources }
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'gets the remote tarball' do
      expect(chef_run).to create_remote_file("#{Chef::Config['file_cache_path']}/goaccess-0.8.5.tar.gz") # rubocop:disable LineLength
    end

    it 'notifies install_goaccess' do
      download = chef_run.remote_file('goaccess')
      expect(download).to notify('bash[install_goaccess]')
    end
  end
end
