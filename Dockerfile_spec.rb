require 'serverspec'
require 'docker'

# Set read timeout to 5 minutes
Docker.options[:read_timeout] = 300

describe "Dockerfile" do
    before(:all) {
        image = Docker::Image.build_from_dir('.', :forcerm => true) do |v|
            if (log = JSON.parse(v)) && log.has_key?("stream")
                $stdout.puts log["stream"]
            end
        end
        image.tag('repo' => 'luiscoms/libepp-nicbr', 'tag' => '1.15-centos7', 'force' => true)
        set :backend, :docker
        set :docker_image, image.id
    }

    describe package('make') do
      it { should be_installed }
    end

    describe package('wget') do
      it { should be_installed }
    end

    describe package('gcc') do
      it { should be_installed }
    end

    describe package('gcc-c++') do
      it { should be_installed }
    end

    describe package('xerces-c-devel') do
      # it { should be_installed.with_version('3.0.0') }
      it { should be_installed }
    end

    describe package('openssl-devel') do
      it { should be_installed }
    end

    describe file('/usr/local/bin/shepp') do
      it { should be_executable }
    end
end
