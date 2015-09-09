Pod::Spec.new do |s|
  s.name             = "ViperMcFlurry"
  s.version          = "0.1.0"
  s.summary          = "Modern framework for implementing VIPER architecture in iOS application."
  s.homepage         = "https://gitlab.rambler.ru/cocoapods/ViperMcFlurry"
  s.license          = 'MIT'
  s.authors           = { "Andrey Zarembo-Godzyatsky" => "a.zarembo-godzyatsky@rambler-co.ru", "Valery Popov" => "v.popov@rambler-co.ru" }
  s.source           = { :git => "https://gitlab.rambler.ru/mobile-dev/VIPERMcFlurry.git", :tag => s.version.to_s }
  #s.social_media_url = ''
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.header_mappings_dir = 'Code'

  s.subspec 'Core' do |cs|
    cs.source_files = "Code/ViperMcFlurry.h", "Code/Core"
  end

  s.subspec 'IntermoduleDataTransfer' do |idt|
    idt.source_files = "Code/IntermoduleDataTransfer.h", "Code/IntermoduleDataTransfer/**/*.{h,m}"
    idt.dependency 'ViperMcFlurry/Core'
  end

  s.subspec 'ModuleFactory' do |mf|
    mf.source_files = "Code/ModuleFactory.h", "Code/ModuleFactory/**/*.{h,m}"
    mf.dependency 'ViperMcFlurry/Core'
  end

  s.subspec 'EmbeddableModules' do |em|
    em.source_files = "Code/EmbeddableModules.h", "Code/EmbeddableModules/**/*.{h,m}"
    em.dependency 'ViperMcFlurry/Core'
  end

end
