#
# Be sure to run `pod lib lint RamblerMcFlurry.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RamblerMcFlurry"
  s.version          = "0.1.0"
  s.summary          = "Набор полезных хелперов, используемых в различных проектах Rambler&Co"
  s.homepage         = "https://gitlab.rambler.ru/cocoapods/RamblerMcFlurry"
  s.license          = 'MIT'
  s.author           = { "Egor Tolstoy" => "e.tolstoy@rambler-co.ru" }
  s.source           = { :git => "https://gitlab.rambler.ru/cocoapods/RamblerMcFlurry.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/igrekde'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RamblerMcFlurry' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
