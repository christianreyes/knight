class Repository < ActiveRecord::Base
	belongs_to :project_type
	has_many :grades
	
	def contents
		path = REPO_PATH + location
		
		out = "\n"
		Dir.foreach(path) { |entry| out += entry + "\n" }
		out
	end
end
