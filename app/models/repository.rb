class Repository < ActiveRecord::Base
	belongs_to :project_type
	has_many :grades
end
