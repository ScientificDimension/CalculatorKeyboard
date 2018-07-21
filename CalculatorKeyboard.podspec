Pod::Spec.new do |s|

    s.name          = File.basename(__FILE__).chomp(".podspec")
    s.version       = "1.0.0"
    s.license       = s.name
    s.summary       = s.name
    s.description   = "Adjusted CalculatorKeyboard from https://github.com/sprint84/CalculatorKeyboard"
    s.homepage      = "https://github.com/ScientificDimension/CalculatorKeyboard"
    s.author        = "Oleg K."
    s.platform      = :ios, "10.0"
    s.swift_version = '4'
    s.source        = { :git => 'https://github.com/ScientificDimension/CalculatorKeyboard', :branch => 'develop', :tag => s.version.to_s}
    s.source_files  = ["CalculatorKeyboard/**/*.{swift, h}", "CalculatorKeyboard/**/*.xib"]
    s.resource      = ['CalculatorKeyboard/**/*.{xcassets}']
    s.xcconfig      = {"HEADER_SEARCH_PATHS" => '$(PODS_ROOT)/CalculatorKeyboard'}

end
