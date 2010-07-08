# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.authors       = "Stephan Zalewski"
  s.description   = %q{Let Integrity tweet after each build}
  s.homepage      = %q{http://integrityapp.com}
  s.name          = %q{integrity_twitter_oauth}
  s.require_path  = 'lib'
  s.summary       = %q{Twitter notifier for the Integrity continuous integration server, using twitters oauth}
  s.version       = "0.0.1"

  s.add_dependency 'twitter'
  s.files         = Dir.glob("lib/**/*")
end

