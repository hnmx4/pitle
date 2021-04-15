# frozen_string_literal: true

require_relative "lib/pitle/version"

Gem::Specification.new do |spec|
  spec.name          = "pitle"
  spec.version       = Pitle::VERSION
  spec.authors       = ["hnmx4"]
  spec.email         = ["hnmnty@gmail.com"]

  spec.summary       = "Pick the one filename from duplicate filenames that have different extensions."
  spec.description   = "Pick the one filename from duplicate filenames that have different extensions."
  spec.homepage      = "https://github.com/hnmx4/pitle"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
