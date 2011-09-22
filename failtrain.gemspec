Gem::Specification.new do |s|
  s.name     = 'failtrain'
  s.version  = '1.0.0'
  s.summary  = 'All aboard the fail train'
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Xavier Shay"]
  s.email    = ["hello@xaviershay.com"]
  s.homepage = "http://github.com/xaviershay/failtrain"
  s.has_rdoc = false

  s.files    = Dir.glob("lib/**/*.rb") +
               Dir.glob("bin/*") +
               %w(README.train README failtrain.gemspec)

  s.bindir       = 'bin'
  s.require_path = 'lib'
  s.executables << %q{failtrain}
end
