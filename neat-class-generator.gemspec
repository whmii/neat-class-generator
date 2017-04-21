Gem::Specification.new do |s|
  s.add_runtime_dependency "sass", "~> 3.4"
  s.authors = [
    "Will McMahan"
  ]
  s.email         = "will@mcmahan.me"
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.homepage      = "http://neat.bourbon.io"
  s.license       = "MIT"
  s.name          = "neat-class-generator"
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ["lib"]
  s.summary       = "A lightweight Sass grid framework"
  s.version       = "1.0.0"
end
