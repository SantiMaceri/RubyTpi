require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
 test 'valid user' do
    user = User.new(username: 'John', password: '12345', screen_name:'Johnsin',  email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without name' do
    user = User.new(email: 'john@example.com', password: '12345', screen_name:'Johnsin')
    refute user.valid?, 'user is valid without a username'
    assert_not_nil user.errors[:username], 'no validation error for username present'
  end

  test 'invalid without email' do
    user = User.new(username: 'John', password: '12345', screen_name:'Johnsin')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end