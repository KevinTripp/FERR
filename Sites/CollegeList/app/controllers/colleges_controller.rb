class CollegesController < ApplicationController
	def new
		@college = College.new
	end

	def create
		@college = College.new(params[:college])
		@college.user_id = session[:user_id]
		if @college.save
			redirect_to user_path(@college.user_id), :notice => "Your college was saved!"
		else
			render "new"
		end
	end

	def show
		@college = College.find_by_id(params[:id])
		@steps = Step.order(:duedate).where("college_id = ?", params[:id])
	end

	def edit
	    @college = College.find(params[:college])
	    if @college.save
			redirect_to user_path(@college.user_id), :notice => "Your college was saved!"
		else
			render "new"
		end
  	end
  	def update
	    @college = College.find(params[:college])
	    if @college.save
			redirect_to user_path(@college.user_id), :notice => "Your college was saved!"
		else
			render "new"
		end
  	end
end