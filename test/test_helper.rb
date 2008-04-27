require 'test/unit'
require 'rubygems'
require 'mocha'
require 'stubba'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'twitter'

class << Test::Unit::TestCase
  def test(name, &block)
    test_name = :"test_#{name.gsub(' ','_')}"
    raise ArgumentError, "#{test_name} is already defined" if self.instance_methods.include? test_name.to_s
    define_method test_name, &block
  end
  
  def expect(expected_value, &block)
    define_method :"test_#{caller.first.split("/").last}" do
      assert_equal expected_value, instance_eval(&block)
    end 
  end
end

# load config
CONFIG = YAML::load(open("#{ENV['HOME']}/.twitter"))