platform :ios, '14.0'
use_frameworks!

target 'iOSLearn' do
  pod 'LookinServer', :configurations => ['Debug']
  pod 'Masonry'    # OC 继续用
  pod 'SnapKit'    # Swift 专用

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
    end
  end
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
  end
end
