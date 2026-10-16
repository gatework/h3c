# frozen_string_literal: true

require "minitest/autorun"
require "h3c"

class H3CTest < Minitest::Test
  def test_version_matches_gemspec
    spec = Gem::Specification.load(File.expand_path("../h3c.gemspec", __dir__))
    assert_equal H3C::VERSION, spec.version.to_s
    assert_equal "h3c", spec.name
  end

  def test_errors_can_be_rescued_as_standard_errors
    assert_operator H3C::Error, :<, StandardError
  end

  def test_package_contains_only_library_and_documentation
    spec = Gem::Specification.load(File.expand_path("../h3c.gemspec", __dir__))
    assert_equal %w[CHANGELOG.md LICENSE README.md lib/h3c.rb lib/h3c/version.rb], spec.files.sort
  end
end
