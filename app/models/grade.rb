class Grade < ActiveRecord::Base
	belongs_to :repository
	
	def grade_repository
		@output_unit = ""
		@output_cucumber = ""
		@unit_info = ""
				
		Dir.chdir(REPO_PATH + repository.location) do
			case repository.project_type.name
			when "Rails"
				@output_unit = `rake test:units`
				@unit_info = UNIT_TEST_REGEXP.match(@output_unit)
				
				if @unit_info[3] == "0" && @unit_info[4] == "0"
					@output_cucumber = `cucumber`
				end
			when "Unit"
				@output_unit = `ruby -Itest credit_cards_test.rb`	
				@unit_info = UNIT_TEST_REGEXP.match(@output_unit)
			end
		end
		
		puts [@output_unit, @output_cucumber, @unit_info].to_s
		
		return [@output_unit, @output_cucumber, @unit_info]
	end
end
