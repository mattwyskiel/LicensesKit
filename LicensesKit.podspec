Pod::Spec.new do |s|
  s.name         = "LicensesKit"
  s.version      = "1.2.2"
  s.summary      = "A simple way to list third-party licenses in your iOS apps"
  s.homepage     = "https://github.com/mattwyskiel/LicensesKit"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author             = { "Matthew Wyskiel" => "mwyskiel@optonline.net" }
  s.social_media_url   = "http://twitter.com/MattWyskiel"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mattwyskiel/LicensesKit.git", :tag => "#{s.version}" }
  s.source_files  = "LicensesKit/LicensesViewController.swift", "LicensesKit/NoticesHtmlBuilder.swift", "LicensesKit/Model", "LicensesKit/Model/Licenses"
  s.resources = ["LicensesKit/Supporting Files/Licenses/*.txt"]
  s.framework  = "UIKit", "WebKit"
  s.dependency 'StringBuilder', '1.1.2'
  s.requires_arc = true

end
