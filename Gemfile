# frozen_string_literal: true

source "https://rubygems.org"

# ruby '~> 2.6' # known problems on ruby 2.7.0
# gem 'ruby', '~> 2.6'
gem 'fastlane','2.163.0'
gem 'cocoapods', '1.9.3'
gem 'cocoapods-repo-update'
gem 'xcode-install'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)

# gem "rails"
