# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top_tv/version'

Gem::Specification.new do |spec|
  spec.name          = "top-tv"
  spec.version       = TopTv::VERSION
  spec.authors       = ["Wendy Lau"]
  spec.email         = ["wlau903@gmail.com"]

  spec.summary       = %q{Top television shows}
  spec.description   = %q{Lists the top television shows as rated on the Rotten Tomatoes website.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["top-tv"]
  spec.require_paths = ["lib", "lib/top_tv"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
