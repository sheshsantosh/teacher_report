class StudentsController < ApplicationController
	before_action :set_student, only: [:edit, :update, :destroy]

	def index
    @students = current_teacher.students
    @student = Student.new
  end

  def new
  @student = Student.new
	end

	def create
	  @student = current_teacher.students.new(student_params)
	  existing_student = Student.find_by(name: @student.name, subject: @student.subject)

	  if existing_student
	    existing_student.marks += @student.marks
	    existing_student.save
	  else
	    @student.save
	  end

	  redirect_to students_path
	end

	def edit
	end

	def update
	  if @student.update(student_params)
	    redirect_to students_path
	  else
	    render :edit
	  end
	end

	def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student was successfully deleted.'
  end

	private

	def set_student
    @student = Student.find(params[:id])
  end

	def student_params
		params.require(:student).permit(:name, :subject, :marks)
	end
end
