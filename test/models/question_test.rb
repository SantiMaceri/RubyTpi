require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
    test "should not save without the required fields" do
	  question = Question.new
	  assert_not question.save, "Saved the user without the required fields"
	end


	test "default status must be false" do
		question= Question.new
		assert_not question.status, "its true"
	end
end
