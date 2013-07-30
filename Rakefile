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
    source_files: ['Headers/core/core_c.h','Headers/core/types_c.h','Headers/core/cvdef.h',
                   'Headers/imgproc/imgproc_c.h', 'Headers/imgproc/types_c.h',
                   'Headers/motion/MotionCV.h', 'Headers/motion/MotionMat.h'],
    force_load: false
  )

  app.codesign_certificate = ENV['CODESIGN_CERTIFICATE'] if ENV['CODESIGN_CERTIFICATE']
  app.provisioning_profile = ENV['PROVISIONING_PROFILE'] if ENV['PROVISIONING_PROFILE']
end
