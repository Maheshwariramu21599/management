class AdvisorController < ApplicationController
    def index
		@advisor = Advisor.all
	end
	def new
	end
	def create
		advisor= Advisor.new(advisor_params)
        if advisor.save
        	redirect_to "/advisor"
        else
        	flash[:errors] = advisor.errors.full_messages
        	redirect_to "/advisor/new"
        end

	end
	def show
		@advisor = Advisor.find(params[:id])
	end
	def edit
		@advisor = Advisor.find(params[:id])
	end
	def update
		advisor = Advisor.find(params[:id])
		if advisor.update(advisor_params)
			redirect_to advisor_path
		else
			flash[:errors] = advisor.errors.full_messages
			redirect_to advisor_path
	    end
	end
	def destroy
		advisor = Advisor.find(params[:id])
		advisor.destroy
		redirect_to "/advisor"
	end
private
def advisor_params
	params.require(:advisor).permit(:first_name, :last_name, :age)
end
end
