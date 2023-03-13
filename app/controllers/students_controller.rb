class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students
    end

    def grades
        students = Student.all.order(grade: :desc)
        render json: students
    end

    def highest_grade
        # take - returns an object fetched by SELECT * FROM people LIMIT 1
        student = Student.where(grade: Student.maximum(:grade)).take
        render json: student
    end
end
