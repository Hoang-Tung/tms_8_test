class Course < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 400 }, uniqueness: {case_sensitive: false}
	validates :total_level, presence: true
end
