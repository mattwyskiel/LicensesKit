source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
install! 'cocoapods', :deterministic_uuids => false

# Disable reporting of stats, so own pods don't get reported
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# -------------------------------------------------

def common_pods
  pod 'StringBuilder'
end

target 'LicensesKit' do
  use_frameworks!
  platform :ios, '9.3'
  common_pods
end

target 'LicensesKitTests' do
  use_frameworks!
  platform :ios, '9.3'
  common_pods
end

# -------------------------------------------------

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ''
      config.build_settings['CODE_SIGNING_REQUIRED'] = 'NO'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      config.build_settings['ENABLE_BITCODE'] = 'YES'
      config.build_settings['SWIFT_VERSION'] = '4.0'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.3'
      config.build_settings['TVOS_DEPLOYMENT_TARGET'] = '9.2'
      config.build_settings['WATCHOS_DEPLOYMENT_TARGET'] = '3.0'
    end
  end

  installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
    configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    configuration.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
  end

end

