Pod::Spec.new do |s|
  s.name         = 'RGNetworking'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.homepage     = ""
  s.author       = { 'Related Code' => 'info@asd.com' }
  s.summary      = ""
  s.source       = { :git => "", :tag => "" }
  s.platform     = :ios
  s.source_files = 'ProgressHUD/ProgressHUD/ProgressHUD.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target  = '9.3'
end
