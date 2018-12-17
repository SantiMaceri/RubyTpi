require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

def setup
  @done = questions(:done)
  @undone = questions(:undone)
end
  
     test 'valid question' do
    
 	   assert @done.valid?
 	 end


	 test "default status must be false" do
		question= Question.new
		assert_not question.status, "its true"
	 end

	 test 'invalid without title' do
 	   @done.title= nil
 	   refute @done.valid?, 'question is valid without a title'
 	   assert_not_nil @done.errors[:title], 'no validation error for title present'
 	 end

 	 test 'invalid without description' do
 	   @done.description= nil
 	   refute @done.valid?, 'question is valid without a description'
 	   assert_not_nil @done.errors[:description], 'no validation error for description present'
 	 end


end
