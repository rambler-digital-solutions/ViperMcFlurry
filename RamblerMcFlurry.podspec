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
  s.version          = "0.0.1"
  s.summary          = "Набор полезных хелперов, используемых в различных проектах Rambler&Co"
  s.homepage         = "https://gitlab.rambler.ru/cocoapods/RamblerMcFlurry"
  s.license          = 'MIT'
  s.authors           = { "Egor Tolstoy" => "e.tolstoy@rambler-co.ru", "Irina Dyagileva" => "i.dyagileva@rambler-co.ru", "Andrey Rezanov" => "a.rezanov@rambler-co.ru" }
  s.source           = { :git => "https://gitlab.rambler.ru/cocoapods/RamblerMcFlurry.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/igrekde'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.default_subspecs = ['Core', 'Interface', 'Testing']

  s.subspec 'Core' do |cs|
    cs.source_files = "Pod/Classes/Core"
  end

  s.subspec 'Interface' do |ui|
    ui.source_files = "Pod/Classes/Interface"
    ui.dependency 'RamblerMcFlurry/Core'
  end

  s.subspec 'Testing' do |ts|
    ts.source_files = "Pod/Classes/Testing.h", "Pod/Classes/Testing"
    ts.dependency 'RamblerMcFlurry/Core'
    ts.framework = 'XCTest'
  end
end
