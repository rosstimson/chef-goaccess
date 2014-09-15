# Encoding: utf-8

require_relative 'spec_helper'

describe 'compiles and installs goaccess' do
  describe file('/usr/local/bin/goaccess') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end

  # GoAccess doesn't have a version flag so the only way of checking the
  # correct version is installed is by outputting the entire help and grepping
  # for the line that includes the version.
  describe command("/usr/local/bin/goaccess -h | grep 'GoAccess -'") do
    it { should return_exit_status 0 }
    it { should return_stdout 'GoAccess - 0.8.5' }
  end
end
