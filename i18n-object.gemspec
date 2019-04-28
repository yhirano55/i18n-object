lib = File.expand_path("./lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "i18n/object/version"

Gem::Specification.new do |s|
  s.name          = "i18n-object"
  s.version       = I18n::Object::VERSION
  s.authors       = ["Yoshiyuki Hirano"]
  s.email         = ["yhirano@me.com"]
  s.homepage      = "https://github.com/yhirano55/i18n-object"
  s.summary       = "Definable I18n objects for easy handing/testing of I18n#translate"
  s.description   = s.summary
  s.license       = "MIT"
  s.files         = Dir.chdir(File.expand_path(".", __dir__)) do
    `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) {|f| File.basename(f) }
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.5.0"

  s.add_dependency "activesupport", ">= 5.0"
  s.add_dependency "i18n"

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
