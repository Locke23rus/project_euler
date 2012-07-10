Gem::Specification.new do |s|
  s.name        = 'euler'
  s.version     = '0.0.1dev'
  s.date        = '2012-07-08'
  s.summary     = 'euler'
  s.description = 'euler'
  s.authors     = ['Kirill Nikitin']
  s.email       = 'kirill.nikitin@locke23rus.com'
  s.files       = Dir.glob('lib/**/*.rb') + Dir.glob('ext/**/*.{c,h,rb}')
  s.extensions  = 'ext/euler/extconf.rb'
  s.homepage    = 'https://github.com/Locke23rus/project_euler'
end
