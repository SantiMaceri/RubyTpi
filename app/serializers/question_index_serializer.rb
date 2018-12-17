class QuestionIndexSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :status, :count_answers



	def count_answers
		object.answers.count
	end
	
	def description
		object.description.truncate(120)
	end

end