#
# Be sure to run `pod lib lint BAOCxxHash.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BAOCxxHash'
  s.version          = '0.1.2'
  s.summary          = 'Objective-C encapsulation of xxHash.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Objective-C encapsulation of xxHash. You can hash NSString, NSData and files...
                       DESC

  s.homepage         = 'https://github.com/benarvin/BAOCxxHash'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'benarvin' => 'benarvin@outlook.com' }
  s.source           = { :git => 'https://github.com/benarvin/BAOCxxHash.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BAOCxxHash/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BAOCxxHash' => ['BAOCxxHash/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
