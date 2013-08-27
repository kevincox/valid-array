# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{valid-array}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Ryan Biesemeyer}]
  s.date = %q{2011-09-06}
  s.description = %q{      All methods that alter the contents of an array that implements this Gem are first checked to
      ensure that the added items are of the types allowed. All methods behave exactly as their Array
      counterparts, including additional forms, block processing, etc.

      Defining a ValidArray Class:

      ```ruby
      class ThingsArray < Array
        extend ValidArray
        restrict_types Thing1, Thing2
      end

      things = ThingsArray.new
      ```

      Generating a single ValidArray

      ```ruby
      things = ValidArray(Thing1,Thing2).new

      These classes can be extended, and their accepted-types appended to after their initial definition.
}
  s.email = %q{ruby-dev@yaauie.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/valid-array.rb",
    "lib/valid-array/functions.rb",
    "spec/spec_helper.rb",
    "spec/valid-array_spec.rb",
    "valid-array.gemspec"
  ]
  s.homepage = %q{http://github.com/yaauie/valid-array}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Provides methods for creating type-enforced Arrays}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<valid-array>, [">= 0"])
      #s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6"])
      #s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.9"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.9"])
    else
      s.add_dependency(%q<valid-array>, [">= 0"])
      #s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6"])
      #s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.9"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<rdoc>, ["~> 3.9"])
    end
  else
    s.add_dependency(%q<valid-array>, [">= 0"])
    #s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6"])
    #s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.9"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<rdoc>, ["~> 3.9"])
  end
end
