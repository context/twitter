require File.dirname(__FILE__) + '/../test_helper'

class BaseTest < Test::Unit::TestCase
  def setup
    @t = Twitter::Base.new('email', 'password')
  end

  test 'default friends method generates request' do
    @t.expects(:request).with('statuses/friends.xml', {:auth => true, :args => {}})
    @t.expects(:users)
    @t.friends
  end

  test 'friends method with lite value generates request' do
    @t.expects(:request).with('statuses/friends.xml?lite=true', {:auth => true, :args => {:lite => true}})
    @t.expects(:users)
    @t.friends(true)
  end

  test 'friends method with options generates request' do
    @t.expects(:request).with('statuses/friends.xml?lite=true', {:auth => true, :args => {:lite => true}})
    @t.expects(:users)
    @t.friends(:lite => true)
  end

  test 'friends by id method generates request' do
    @t.expects(:request).with('statuses/friends.xml?id=1', {:auth => true, :args => {:id => 1}})
    @t.expects(:users)
    @t.friends_for(1)
  end

  test 'friends by id and options generates request' do
    @t.expects(:request).with('statuses/friends.xml?id=1&lite=true', {:auth => true, :args => {:id => 1, :lite => true}})
    @t.expects(:users)
    @t.friends_for(1, :lite => true)
  end
end