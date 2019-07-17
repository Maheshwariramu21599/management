class WorkersController < InheritedResources::Base
  def index
		@Workers = Worker.all
	end
	def new
	end
	def create
		workers= Worker.new(worker_params)
        if workers.save
        	redirect_to "/workers"
        else
        	flash[:errors] = workers.errors.full_messages
        	redirect_to "/workers/new"
        end

	end
	def show
		@workers = Worker.find(params[:id])
	end
	def edit
		@workers = Worker.find(params[:id])
	end
	def update
		workers = Worker.find(params[:id])
		if workers.update(worker_params)
			redirect_to workers_path
		else
			flash[:errors] = worker.errors.full_messages
			redirect_to workers_path
	    end
	end
	def destroy
		workers = Worker.find(params[:id])
		workers.destroy
		redirect_to "/workers"
	end



  private

    def worker_params
      params.require(:worker).permit(:first_name, :last_name, :age, :team)
    end
end

