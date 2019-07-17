class StudentController < ApplicationController
	before_action :authenticate_user!
	def index
		#@user ||= current_user
		#@Student = @user.Student.all if @user
		@Student = Student.all
		@count = Student.all.count
	    obj = User.find_by(email: current_user.email)
		if obj and obj.email == "superuser@gmail.com"
			@Student = Student.all
		elsif obj and ( obj.email == "fazilla@gmail.com" or obj.email == "grace@gmail.com" )
			#fail
			id = Advisor.find_by(email: obj.email)
			@Student = 	Student.where(advisor_id: id.id)
			@count = @Student.all.count
		end
		
	end

	def new
		#obj2 = User.find_by(email: current_user.email)
		#id1 = Advisor.find_by(email: obj2.email)
		#sp = Advisor.where(first_name: id1.first_name)
	   @hash = {}
	   obj = Advisor.all
	   obj.each do |val|
			@hash.store(val.id, val.first_name)
	   end
	   @hash1 = {}
	   obj1 = Room.all
	   obj1.each do |val1|
		    @hash1.store(val1.id, val1.room_no)
	   end
	end

	def create

		
		student= Student.new(student_params)
		
		#byebug
		#advisor_name=params[:advisor_id]
		#params[:advisor_id]=(Advisor.find_by(first_name:advisor_name))
		#room_number=params[:room_id]
		#params[:room_id]=(Room.find_by(room_no:room_number))
		
		#byebug
        if student.save
        	redirect_to "/student"
        else
        	flash[:errors] = student.errors.full_messages
        	redirect_to "/student/new"
        end

	end
	def show
		@student = Student.find(params[:id])
	end
	def edit
		@student = Student.find(params[:id])
	end
	def update
		student = Student.find(params[:id])
		if student.update(student_params)
			redirect_to student_path
		else
			flash[:errors] = student.errors.full_messages
			redirect_to student_path
	    end
	end
	def destroy
		student = Student.find(params[:id])
		student.destroy
		redirect_to "/student"
	end
private
def student_params
	obj = Advisor.find_by(email: current_user.email)
	params.require(:student).permit(:first_name, :last_name, :age, :department, :year).merge(advisor_id: params[:advisor_name],room_id: params[:room_no], advisor_id: obj.id)
end
end
