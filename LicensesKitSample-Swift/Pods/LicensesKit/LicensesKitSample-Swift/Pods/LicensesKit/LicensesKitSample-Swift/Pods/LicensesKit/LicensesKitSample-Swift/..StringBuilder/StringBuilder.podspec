Pod::Spec.new do |s|
  s.name         = "StringBuilder"
  s.version      = "0.0.1"
  s.summary      = "A simple reimagining of Java's StringBuilder class for Swift"
  s.description  = <<-DESC
                   A simple reimagining of Java's StringBuilder class for Swift. This was written in conjunction with [LicensesKit](https://github.com/mattwyskiel/LicensesKit)
                   DESC
  s.homepage     = "https://github.com/mattwyskiel/StringBuilder"
  s.license      = { :type => 'Apache License, Version 2.0', :file => "LICENSE" }
  s.author             = { "Matthew Wyskiel" => "mwyskiel@optonline.net" }
  s.social_media_url   = "http://twitter.com/MattWyskiel"
  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => "https://github.com/mattwyskiel/StringBuilder.git", :tag => "#{s.version}" }
  s.source_files  = "StringBuilder/StringBuilder.swift"
  s.framework  = "Foundation"
  s.requires_arc = true
end
