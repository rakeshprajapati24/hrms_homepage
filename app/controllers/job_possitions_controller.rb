class JobPossitionsController < ApplicationController
	def index
		@job_possitions = JobPossition.all
	end

	def new
		@job_possition = JobPossition.new
	end

	def edit
		@job_possitions = JobPossition.find_by_id(params[:id])
	end

	def show
		@job_possitions = JobPossition.find_by_id(params[:id])
	end

	def create
		@job_possition = JobPossition.new(params_job_possition)
		if @job_possition.save
			redirect_to job_possitions_path
		else
			render 'new'
		end
	end

	def update
		@job_possition = JobPossition.find_by_id(params[:id])
		@JobPossition.update_attributes(params_job_possition)
		if @job_possition.save
			redirect_to job_possitions_path
		else
			render 'edit'
		end
	end
	def destroy
		@job_possition = JobPossition.find_by_id(params[:id])
		@job_possition.destroy
		redirect_to job_possitions_path
	end

	private
	def params_job_possition
		params.require(:job_possition).permit!
	end
	
end
