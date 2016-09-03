Pod::Spec.new do |s|

  s.name         = "ViperMcFlurry"
  s.version      = "1.4.0"
  s.summary      = "Modern framework for implementing VIPER architecture in iOS application."

  s.homepage         = "https://gitlab.rambler.ru/cocoapods/ViperMcFlurry"
  s.license          = 'MIT'
  s.authors           = { "Andrey Zarembo-Godzyatsky" => "a.zarembo-godzyatsky@rambler-co.ru", "Valery Popov" => "v.popov@rambler-co.ru", "Gleb Novik" => "g.novik@rambler-co.ru" }

  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://gitlab.rambler.ru/g.novik/VIPERMcFlurry.git", :tag => s.version.to_s }

  s.source_files =  "Source/*.{h,m}"

end
