class Course < ActiveRecord::Base
	has_many :activate_course_subjects, class_name: "CourseSubject", foreign_key: "course_id", dependent: :destroy
	has_many :subjects, through: :activate_course_subjects, source: :subject
	validates :name, presence: true, length: { maximum: 400 }, uniqueness: {case_sensitive: false}
	validates :total_level, presence: true
	validates :status, presence: true
end
