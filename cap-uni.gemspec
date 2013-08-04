# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap/uni/version'

Gem::Specification.new do |spec|
  spec.name          = "cap-uni"
  spec.version       = Cap::Uni::VERSION
  spec.authors       = ["Ivan Histand"]
  spec.email         = ["ivan@badgeretl.com"]
  spec.description   = %q{Unicorn specific Capistrano tasks}
  spec.summary       = %q{Unicorn specific Capistrano tasks for rails 4.0}
  spec.homepage      = "https://github.com/badgeretl/cap-uni.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "capistrano", "~> 3.0.0"

  # signing key and certificate chain
  spec.signing_key = '/tmp/gem-private_key.pem'
  spec.cert_chain  = ['gem-public_cert.pem']
end

