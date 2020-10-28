require File.expand_path('../spec_helper', __FILE__)

module XcodeInstall
  describe Command::List do
    before do
      installer.stubs(:exists).returns(true)
    end

    def installer
      @installer ||= Installer.new
    end

    def fake_xcode(name)
      fixture = Pathname.new('spec/fixtures/xcode_63.json').read
      xcode = Xcode.new(JSON.parse(fixture))
      xcode.stubs(:name).returns(name)
      xcode
    end

    def fake_xcodes(*names)
      xcodes = names.map { |name| fake_xcode(name) }
      installer.stubs(:xcodes).returns(xcodes)
    end

    def fake_installed_xcode(name)
      installed_name = name.split(' ').join('.')
      xcode_path = "/Applications/Xcode-#{installed_name}.app"
      xcode_version = name.split(' ').first
      xcode_version << '.0' unless name.include? '.'

      installed_xcode = InstalledXcode.new(xcode_path)
      installed_xcode.stubs(:version).returns(xcode_version)
      installed_xcode.stubs(:bundle_version).returns(Gem::Version.new(xcode_version))
      installed_xcode
    end

    def fake_installed_xcodes(*names)
      xcodes = names.map { |name| fake_installed_xcode(name) }
      installer.stubs(:installed_versions).returns(xcodes)
    end

    describe '#list' do
      it 'lists all versions' do
        fake_xcodes '1', '2.3', '2.3.1', '2.3.2', '3 some', '4 beta', '10 beta'
        fake_installed_xcodes
        installer.list.should == "1\n2.3.2\n2.3.1\n2.3\n3 some\n4 beta\n10 beta"
      end
    end

    describe '#list_annotated' do
      it 'lists all versions with annotations' do
        fake_xcodes '1', '2.3', '2.3.1', '2.3.2', '3 some', '4.3.1 for Lion', '9.4.1', '10 beta'
        fake_installed_xcodes '2.3', '4.3.1 for Lion', '10 beta'
        installer.list.should == "1\n2.3.2\n2.3.1\n2.3 (installed)\n3 some\n4.3.1 for Lion (installed)\n9.4.1\n10 beta (installed)"
      end

      it 'distinguish between beta and official_version' do
        fake_xcodes '11.4', '11.4 beta'
        fake_installed_xcodes '11.4'
        installer.list.should == "11.4 beta\n11.4 (installed)"
      end

      it 'distinguish each beta versions' do
        fake_xcodes '11.4 beta', '11.4 beta 3'
        fake_installed_xcodes '11.4 beta'
        installer.list.should == "11.4 beta 3\n11.4 beta (installed)"
      end
    end
  end
end
