class SessionsController < ApplicationController

	before_action :set_user, only: :create

	def create
    
	    #@user = User.find_by(username:params[:username])	     
	    if @user && @user.authenticate(params[:password]) 
	      @user.token_update
	      json_response(@user)
	    else
	      json_response({}, :unauthorized)
	    end
	 end

	private

	  def set_user
	    @user = User.find_by!(username: params['username'])	    	
	  end
	 
end
