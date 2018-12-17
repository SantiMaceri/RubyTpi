class QuestionsController < ApplicationController
before_action :set_question, only: [:update, :edit, :show, :resolve, :destroy]
before_action :set_user, only: [:create, :update, :resolve, :destroy]

# GET /questions

	  def index 
	  	case params['sort']

	  	when "pending_first"
	  		@questions = Question.pending_first.limit(50)
	  	when "needing_help"
	  		@questions = Question.needing_help.limit(50)
	  	else
		  	@questions = Question.latest.limit(50)
	  	end
	  	
		render json: @questions, each_serializer: QuestionIndexSerializer
	 end

# GET /question/:id
	 def show
	 	json_response(@question, serializer: QuestionCompoundSerializer) 
	 	
	 end

# POST /questions

 	 def create
	    @question = @user.questions.create!(question_params)
	    json_response(@question, :created)
  	 end

# PUT /questions/:id

  	 def update
  	 	 	if @question.your_user? (@user)
  	 	 		@question.update(question_params)
	    	    json_response(@question)
  	 	 	else
	     	    json_response({}, :unauthorized)
	    	end
	 end

# PUT /questions/:id/resolve


	 def resolve

	 	if @question.your_user? (@user)
	 		if @question.answers.exists? (params[:answer_id])
	 			@question.toggle_true
	 			@question.answer_id= params[:answer_id]
	 			@question.save
	 			json_response(@question)
	 		else
	 			json_response("This answer does not belong to this question", :unprocessable_entity)
	 		end
	 	else
	 		json_response({}, :unauthorized)
	 	end
	 end

# DELETE /questions/:id

	def destroy #FALTA POR LAS RESPUESTAS
		if @question.your_user? (@user)
			if !@question.answers.exists?
				@question.destroy
				json_response(@question)
			else
				json_response("This question has answers, cant delete", :unprocessable_entity)
			end
		else
			json_response({}, :unauthorized)
		end
	end

	private

	  def set_user
	    @user = User.find_by!(token: request.headers['X-QA-Key'])
	    json_response({}, :unauthorized) if !@user.valid_token?
	    	
	  end

	  def set_question
	    @question = Question.find(params[:id])
	  end

	  def question_params
	    # whitelist params
	    params.permit(:title, :description)
	  end

end
