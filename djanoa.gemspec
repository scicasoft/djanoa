# coding: utf-8
Gem::Specification.new do |s|
  s.name               = "djanoa"
  s.version            = "0.0.1"
  s.default_executable = "djanoa"

  s.add_dependency 'rest-client', '>= 1.6.7'
  s.add_dependency "nokogiri", "~> 1.5.6"
  s.required_rubygems_version = '>= 1.3.6'
  s.authors = ["Cheikh Sidya CAMARA"]
  s.date = %q{2013-03-07}
  s.description = %q{une gem pour interfacer les applications ruby avec la plateforma Djanoa}
  s.email = %q{scicasoft@gmail.com}
  s.files = %w(LICENSE.md README.md djanoa.gemspec)
  s.files += Dir.glob("lib/**/*.rb")
  s.homepage = %q{http://rubygems.org/gems/djanoa}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = s.description
end