require 'test_helper'

class UserTest < ActiveSupport::TestCase

# uses test/fixtures/users.yml

def setup
  @user = users(:valid)
  @expired = users(:expired)
end
  
	 test 'valid user' do
    
 	   assert @user.valid?
 	 end

 	 test 'invalid without name' do
 	   @user.username= nil
 	   refute @user.valid?, 'user is valid without a username'
 	   assert_not_nil @user.errors[:username], 'no validation error for username present'
 	 end

	 test 'invalid without email' do
	   @user.email = nil
	   refute @user.valid?
	   assert_not_nil @user.errors[:email]
	 end

	 test '#questions' do
  		assert_equal 2, @user.questions.size
 	 end

  ## NO SIGO CON ESTOS TIPOS DE TEST ASI NO ABUSO DE TRIVIALIDAD, DEBERIA HABER UNO POR CADA CAMPO OBLIGATORIO

 	 test 'valid_token' do
 		assert @user.valid_token?
 		refute @expired.valid_token?
 	 end 

 	 	 
end