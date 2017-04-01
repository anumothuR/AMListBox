#
# Be sure to run `pod lib lint AMListBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMListBox'
  s.version          = '0.1.0'
  s.summary          = 'AMListBox is a revelotionary remedy for classic combo box or listbox. Just use your UILable you can use AMList Box.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Spec
Xcode 8+,
iOS 10,
Swift 3

Usage
AMListBox will help you to create ComboListBox in iOS.

* List will be open in seperate page in a tableview
* User can search the list and choose
* already selected item should be in the top.
* Multiselection is not supported.
* Xib has been attached for easy reference.
* Support only on String list now. Will change it later as generic one.

                       DESC

  s.homepage         = 'https://github.com/anumothuR/AMListBox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anumothuR' => 'anumothu911@gmail.com' }
  s.source           = { :git => 'https://github.com/anumothuR/AMListBox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AMListBox/Classes/**/*'
  
   s.resource_bundles = {
     'AMListBox' => ['AMListBox/**/*.xib']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
