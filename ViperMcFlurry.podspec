Pod::Spec.new do |s|
  s.name             = "ViperMcFlurry"
  s.version          = "1.3.1"
  s.summary          = "Modern framework for implementing VIPER architecture in iOS application."
  s.homepage         = "https://github.com/rambler-ios/ViperMcFlurry"
  s.license          = 'MIT'
  s.authors           = { "Andrey Zarembo-Godzyatsky" => "a.zarembo-godzyatsky@rambler-co.ru", "Valery Popov" => "v.popov@rambler-co.ru" }
  s.source           = { :git => "https://github.com/rambler-ios/ViperMcFlurry.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
  s.header_mappings_dir = 'Code'

  s.subspec 'Core' do |cs|
    cs.source_files = "Code/ViperMcFlurry.h", "Code/Core"
  end

  s.subspec 'IntermoduleDataTransfer' do |idt|
    idt.header_mappings_dir = "Code/IntermoduleDataTransfer"
    idt.source_files = "Code/IntermoduleDataTransfer.h", "Code/IntermoduleDataTransfer/**/*.{h,m}"
    idt.dependency 'ViperMcFlurry/Core'
  end

end
