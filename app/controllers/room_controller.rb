class RoomController < ApplicationController
    def index
		@Room = Room.all
	end
	def new
	end
	def create
		room= Room.new(room_params)
        if room.save
        	redirect_to "/room"
        else
        	flash[:errors] = room.errors.full_messages
        	redirect_to "/room/new"
        end

	end
	def show
		@room = Room.find(params[:id])
	end
	def edit
		@room = Room.find(params[:id])
	end
	def update
		room = Room.find(params[:id])
		if room.update(room_params)
			redirect_to room_path
		else
			flash[:errors] = room.errors.full_messages
			redirect_to room_path
	    end
	end
	def destroy
		room = Room.find(params[:id])
		room.destroy
		redirect_to "/room"
	end
private
def room_params
	params.require(:room).permit(:room_no, :room_type)
end
end

