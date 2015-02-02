class Subject < ActiveRecord::Base
	has_many :activate_course_subjects, class_name: "CourseSubject", foreign_key: "subject_id", dependent: :destroy
	has_many :courses, through: :activate_course_subjects, source: :course
end
