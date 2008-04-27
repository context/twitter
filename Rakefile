require 'config/requirements'
require 'config/hoe' # setup Hoe + all gem configuration

Hoe.new "twitter", "0.2.6" do |p|
  p.author = "John Nunemaker"
  p.email = 'jnunemaker@whatevs.com'
  p.test_globs << "test/**/*_test.rb"
end

Dir['tasks/**/*.rake'].each { |rake| load rake }