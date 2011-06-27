Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "refinerycms-store"
  s.version     = "0.0.1"
  s.authors     = ["Crowdint"]
  s.date        = '2011-06-27'
  s.email       = ["crowdint@crowdint.com"]
  s.homepage    = ""
  s.summary     = "Store engine for Refinery CMS"
  s.description = "Store engine for Refinery CMS"

  s.add_dependency('haml', '> 3.1.0')
  s.rubyforge_project = "refinerycms-store"
  s.require_paths = ["lib"]
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
