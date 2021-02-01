
Pod::Spec.new do |s|
  s.name         = "SPWIndoormap"
  s.version      = "1.1.3"
  s.summary      = "SPWIndoormap"
  s.description  = <<-DESC
                  Siam Piwat Indoor map for React-Native
                   DESC
  s.homepage     = "https://github.com/developer-smartsoftasia/SiamPiwatRNIndoorMap"
  s.license      = "Siam Piwat Company Limited"
  s.author       = "Siam Piwat Company Limited"
  s.platform     = :ios, "10.0"
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/author/RNIndoormap.git", :tag => "master" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "SiamPiwatRNIndoorMapSDK", "0.1.6"

end

  