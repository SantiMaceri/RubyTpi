class QuestionsController < ApplicationController
before_action :set_question, only: [:update, :edit, :show, :resolve, :destroy]
before_action :set_user, only: [:create, :update]

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

    json_response(@questions)
  end

# GET /question/:id
	 def show
	    json_response(@question)
	 end

# POST /questions

 	 def create
	    @question = @user.questions.create!(question_params)
	    json_response(@question, :created)
  	 end

# PUT /questions/:id

  	 def update
  	 	 	if @question.user==@user
  	 	 		@question.update(question_params)
	    	    json_response(@question)
  	 	 	else
	     	    json_response({}, :unauthorized)
	    	end
	 end

# PUT /questions/:id


	 def resolve
	 	
	 end

# DELETE /questions/:id

	def destroy
		@question.destroy
		json_response(@question)
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
