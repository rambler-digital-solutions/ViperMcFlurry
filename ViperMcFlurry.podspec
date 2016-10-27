Pod::Spec.new do |s|

  s.name         = "ViperMcFlurry"
  s.version      = "1.5.2"
  s.summary      = "Modern framework for implementing VIPER architecture in iOS application."

  s.homepage         = "https://github.com/rambler-digital-solutions/ViperMcFlurry"
  s.license          = 'MIT'
  s.authors           = { "Andrey Zarembo-Godzyatsky" => "a.zarembo-godzyatsky@rambler-co.ru", "Valery Popov" => "v.popov@rambler-co.ru" }
  s.source           = { :git => "https://github.com/rambler-digital-solutions/ViperMcFlurry.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source       = { :git => "https://github.com/rambler-digital-solutions/ViperMcFlurry.git", :tag => s.version.to_s }

  s.source_files =  "Source/*.{h,m}"

end
