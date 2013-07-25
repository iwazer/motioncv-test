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

  app.vendor_project('vendor/opencv2.framework', :static,
    products: ['opencv2'],
    force_load: false
  )
end
