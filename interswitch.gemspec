# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interswitch/version'

Gem::Specification.new do |s|
  s.name        = 'interswitch'
  s.version       = Interswitch::VERSION
  s.date        = '2016-07-19'
  s.summary     = "Interswitch!"
  s.description = "A library for...???"
  s.authors     = [ "Ayodele Ademosu" ]
  s.email       = 'ayoademosu@gmail.com'
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.homepage    = 'http://github.com/aaademosu/interswitch.git'
  s.license       = 'MIT'
end



