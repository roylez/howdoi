Gem::Specification.new do |s|
  s.name        = 'howdoi'
  s.version     = '0.0.3'
  s.date        = '2013-01-21'
  s.summary     = "a code search tool"
  s.description = "This is ruby clone of original Python howdoi by Benjamin Gleitzman (@gleitz)"
  s.authors     = ["Roy Zuo"]
  s.email       = 'roylzuo@gmail.com'
  s.files       = Dir["{lib}/*.rb", "bin/*", "LICENSE", "*.md"]
  s.homepage    = 'http://rubygems.org/gems/howdoi'
  s.executables = ['howdoi']
  s.add_runtime_dependency 'nokogiri', '>= 1.5.6'
end
