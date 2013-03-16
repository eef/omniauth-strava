# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/strava/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-strava'
  s.summary  = 'Strava strategy for OmniAuth'
  s.authors  = ['Arthur Canal']
  s.email    = ['arthur.canal@gmail.com']
  s.homepage = 'https://github.com/eef/omniauth-strava'
  s.version  = OmniAuth::Strava::VERSION

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
end
