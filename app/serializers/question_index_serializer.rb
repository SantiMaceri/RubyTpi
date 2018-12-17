class QuestionIndexSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :status

	def description
		object.description.truncate(120)
	end

end