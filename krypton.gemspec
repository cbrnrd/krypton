$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), 'lib')))
require "core"

Gem::Specification.new do |spec|
  spec.name          = "krypton"
  spec.version       = VERSION
  spec.authors       = ["cbrnrd"]
  spec.email         = ["0xCB@protonmail.com"]
  spec.summary       = %q{A command-line tool for easy encryption and decryption of data.}
  spec.homepage      = "https://github.com/cbrnrd/krypton"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|#{__FILE__})/})
  end
  spec.date          = Time.now.strftime('%Y-%m-%d')
  spec.executables   = %w[krypton]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "paint"
  spec.add_runtime_dependency "aes"
  spec.add_runtime_dependency "commander"
  spec.add_runtime_dependency "rotp"
  spec.add_runtime_dependency "http"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
