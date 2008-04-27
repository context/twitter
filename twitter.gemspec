(in /Users/rick/p/twitter)
Gem::Specification.new do |s|
  s.name = %q{twitter}
  s.version = "0.2.6"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2008-04-27}
  s.default_executable = %q{twitter}
  s.description = %q{a command line interface for twitter, also a library which wraps the twitter api}
  s.email = %q{nunemaker@gmail.com}
  s.executables = ["twitter"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["CHANGELOG", "History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/twitter", "config/hoe.rb", "config/requirements.rb", "examples/twitter.rb", "lib/twitter.rb", "lib/twitter/base.rb", "lib/twitter/command.rb", "lib/twitter/direct_message.rb", "lib/twitter/easy_class_maker.rb", "lib/twitter/status.rb", "lib/twitter/user.rb", "lib/twitter/version.rb", "log/debug.log", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/remote.rb", "test/test_helper.rb", "test/unit/base_test.rb", "test/unit/direct_message_test.rb", "test/unit/status_test.rb", "test/unit/user_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://twitter.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter}
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{a command line interface for twitter, also a library which wraps the twitter api}
  s.test_files = ["test/test_helper.rb"]

  s.add_dependency(%q<hpricot>, [">= 0"])
  s.add_dependency(%q<activesupport>, [">= 0"])
end
Gem::Specification.new do |s|
  s.name = %q{twitter}
  s.version = "0.2.6"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2008-04-27}
  s.default_executable = %q{twitter}
  s.description = %q{}
  s.email = %q{jnunemaker@whatevs.com}
  s.executables = ["twitter"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["CHANGELOG", "History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/twitter", "config/hoe.rb", "config/requirements.rb", "examples/twitter.rb", "lib/twitter.rb", "lib/twitter/base.rb", "lib/twitter/command.rb", "lib/twitter/direct_message.rb", "lib/twitter/easy_class_maker.rb", "lib/twitter/status.rb", "lib/twitter/user.rb", "lib/twitter/version.rb", "log/debug.log", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/remote.rb", "test/test_helper.rb", "test/unit/base_test.rb", "test/unit/direct_message_test.rb", "test/unit/status_test.rb", "test/unit/user_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{... a sweet little diddy that helps you twitter your life away}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter}
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{}
  s.test_files = ["test/test_helper.rb", "test/unit/base_test.rb", "test/unit/direct_message_test.rb", "test/unit/status_test.rb", "test/unit/user_test.rb"]
end
