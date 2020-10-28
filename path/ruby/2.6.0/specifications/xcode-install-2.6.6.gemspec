# -*- encoding: utf-8 -*-
# stub: xcode-install 2.6.6 ruby lib

Gem::Specification.new do |s|
  s.name = "xcode-install".freeze
  s.version = "2.6.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Boris Bu\u0308gling".freeze]
  s.date = "2020-06-24"
  s.description = "Download, install and upgrade Xcodes with ease.".freeze
  s.email = ["boris@icculus.org".freeze]
  s.executables = ["xcversion".freeze, "\u{1F389}".freeze]
  s.files = ["bin/xcversion".freeze, "bin/\u{1F389}".freeze]
  s.homepage = "https://github.com/neonichu/xcode-install".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Xcode installation manager.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<claide>.freeze, [">= 0.9.1", "< 1.1.0"])
      s.add_runtime_dependency(%q<fastlane>.freeze, [">= 2.1.0", "< 3.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    else
      s.add_dependency(%q<claide>.freeze, [">= 0.9.1", "< 1.1.0"])
      s.add_dependency(%q<fastlane>.freeze, [">= 2.1.0", "< 3.0.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    end
  else
    s.add_dependency(%q<claide>.freeze, [">= 0.9.1", "< 1.1.0"])
    s.add_dependency(%q<fastlane>.freeze, [">= 2.1.0", "< 3.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
  end
end
