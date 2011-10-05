class Grade < ActiveRecord::Base
	belongs_to :repository
	
	def grade_repository
		@output_unit = ""
		@output_cucumber = ""
		@unit_info = ""
		
		puts "GOT HERE"
		
		Dir.chdir(REPO_PATH + repository.location) do
			if repository.project_type.name == "Rails"

				
				@output_unit = `rake test:units`
				@unit_info = UNIT_TEST_REGEXP.match(@output_unit)
				
				#if @info[3] == "0" && @info[4] == "0"
				#	@output_cucumber = `cucumber`
				#end
			end
		end
		
		puts [@output_unit, @output_cucumber, @unit_info].to_s
		
		return [@output_unit, @output_cucumber, @unit_info]
	end
end
