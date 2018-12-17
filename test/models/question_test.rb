require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

def setup
  @user = users(:valid)
  @done = questions(:done)
  @undone = questions(:undone)
  @answer = answers(:validToDone)
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

 	 test 'your_answer?'do
 	 	@done.answer_id=@answer.id
 	 	assert @done.your_answer? @answer.id
 	end

 	test 'your_user?' do
 		assert @done.your_user? @user
 	end

 	test '#needing_help' do
	  assert_includes Question.needing_help, @undone
	  refute_includes Question.needing_help, @done
	end

	test '#answers' do
  		assert_equal 2, @done.answers.size
 	 end


end
