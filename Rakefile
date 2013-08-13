# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'opencv-test'
  app.info_plist['UIMainStoryboardFile'] = 'MainStoryboard'

  app.frameworks += ['AVFoundation','AssetsLibrary']
  app.libs += ['-lc++']

  app.codesign_certificate = ENV['CODESIGN_CERTIFICATE'] if ENV['CODESIGN_CERTIFICATE']
  app.provisioning_profile = ENV['PROVISIONING_PROFILE'] if ENV['PROVISIONING_PROFILE']
end

task :clean do
  bs = File.join(File.dirname(__FILE__), 
                 'vendor/opencv2.framework', 'opencv2.framework.bridgesupport')
  puts "    Delete #{bs}"
  File.delete(bs) if File.exist?(bs)
end
