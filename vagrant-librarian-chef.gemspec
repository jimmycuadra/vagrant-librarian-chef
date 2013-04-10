# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-librarian-chef/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-librarian-chef"
  spec.version       = VagrantPlugins::LibrarianChef::VERSION
  spec.authors       = ["Jimmy Cuadra"]
  spec.email         = ["jimmy@jimmycuadra.com"]
  spec.description   = %q{A Vagrant plugin to install Chef cookbooks using Librarian-Chef.}
  spec.summary       = %q{A Vagrant plugin to install Chef cookbooks using Librarian-Chef.}
  spec.homepage      = "https://github.com/jimmycuadra/vagrant-librarian-chef"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "librarian-chef"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
