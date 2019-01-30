Pod::Spec.new do |s|

  s.name             = "TestPod"
  s.version          = "0.0.1"
  s.summary       = "A short description of MeliDevSDK."
  s.homepage     = "http://EXAMPLE/MeliDevSDK"
  s.license           = "None"
  s.author            = { "author" => "author@gmail.com" }
  s.platform         = :ios, "8.0"

  s.requires_arc  = true
  s.homepage     = 'https://github.com/tonymillion/Reachability'
  s.source           = { :git => 'https://github.com/tonymillion/Reachability.git', :tag => 'v3.1.0' }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.homepage     = 'https://github.com/tonymillion/Reachability'
  s.source            = { :git => 'https://github.com/tonymillion/Reachability.git', :tag => 'v3.1.0' }
  s.source_files    = "LibraryComponents/Classes/**/*.{h,m}"
  s.resources        = "LibraryComponents/**/*.xib", "LibraryComponents/Assets/**/*.xcassets", "LibraryComponents/Assets/**/*.plist", "LibraryComponents/Assets/**/*.ttf"

end
