class CourseSubject < ActiveRecord::Base
	belongs_to :course, class_name: "Course"
	belongs_to :subject, class_name: "Subject"
	validates :course_id, presence: true
	validates :subject_id, presence: true
end
