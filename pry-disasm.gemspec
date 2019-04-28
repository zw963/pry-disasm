require File.expand_path('../lib/pry/disasm/version', __FILE__)

Gem::Specification.new do |s|
  s.name                        = 'pry-disasm'
  s.version                     = Pry::Disasm::VERSION
  s.date                        = Time.now.strftime('%F')
  s.required_ruby_version       = '>= 1.9'
  s.authors                     = ['Billy.Zheng(zw963)']
  s.email                       = ['vil963@gmail.com']
  s.summary                     = ''
  s.description                 = ''
  s.homepage                    = 'http://github.com/zw963/pry-disasm'
  s.license                     = 'MIT'
  s.require_paths               = ['lib']
  s.files                       = `git ls-files bin lib *.md LICENSE`.split("\n")
  s.files                      -= Dir['images/*.png']
  s.executables                 = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f) }

  s.add_runtime_dependency 'pry'
  s.add_development_dependency 'rake'
end
