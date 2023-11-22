# frozen_string_literal: true

require_relative 'lib/json_logic/version'

Gem::Specification.new do |spec|
  spec.name = 'json_logic'
  spec.version = JsonLogic::VERSION
  spec.authors = ['Volodymyr Stashchenko', 'Andriy Savka']

  spec.summary = 'Build complex rules, serialize them as JSON, and execute them in ruby.'
  spec.description = 'Build complex rules, serialize them as JSON, and execute them in ruby. See https://jsonlogic.com'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob('{lib}/**/*', File::FNM_DOTMATCH, base: __dir__)

  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_dependency 'activesupport'
end
