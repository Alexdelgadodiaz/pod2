#
# Be sure to run `pod lib lint TGCoreiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TGCoreiOS'
  s.version          = '0.1.0'
  s.summary          = 'Private pod TGCore from intelinova iOS project'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
  A private pod that incudes MVVM pattern for our TGCore project. Provides all the elements needed to run and build all different apps just from this source files.

  This lib has already all dependecies added so just type down in terminal - pod install -. In case of missing binary code plugging type - gem install cocoapods-binary - to install oficial plugging for prebuilding frameworks for better performance.
                         DESC

  s.homepage         = 'https://intelinovasoftware.visualstudio.com/TRAININGYM/_git/TG%20Core%20iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Copyright', :file => 'LICENSE' }
  s.author           = { 'alexdelgadodiaz' => 'alejandro.delgado@trainingym.com' }
  s.source           = { :git => 'https://intelinovasoftware.visualstudio.com/TRAININGYM/_git/TG%20Core%20iOS', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.1'
  s.swift_versions = '5.1'

  s.source_files = 'TGCoreiOS/Classes/**/*'
  
   s.resource_bundles = {
     'TGCoreiOS' => ['TGCoreiOS/Assets/*']
   }

   s.resources = "TGCoreiOS/Assets/*.xcassets"


  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'SwiftUI'
   s.dependency 'Parse', '~> 1.17.3'
end
