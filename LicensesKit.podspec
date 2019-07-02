Pod::Spec.new do |s|
  s.name = 'LicensesKit'
  s.version = '2.0.0'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'Making giving credit where credit is due easier than ever before'
  s.homepage = 'https://mattwyskiel.com'
  s.social_media_url = 'https://twitter.com/mattwyskiel'
  s.authors = { "Matthew Wyskiel" => "mwwyskiel@gmail.com" }
  s.source = { :git => "https://github.com/MattWyskiel/LicensesKit.git", :tag  => "v"+s.version.to_s }
  s.platforms = { :ios => "9.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
  s.requires_arc = true
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.4.0'

  s.default_subspec = "Core"
  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/**/*.swift"
    ss.framework  = "Foundation"
 end
end
