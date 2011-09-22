class HomeController < ApplicationController
  def grade
	repo_path = "repositories/#{params[:reponame]}"
	Dir.chdir(repo_path) do
		if Dir.entries(Dir.pwd).include?("app") && Dir.entries(Dir.pwd).include?("public")
			# rails application
			@output_unit = `rake test:units`
			
			@info = /(\d+) tests, (\d+) assertions, .*(\d+) failures, .*(\d+) errors, .*(\d+) skips/.match(@output_unit)
			
			if @info[3] == "0" && @info[4] == "0"
				@output_cucumber = `cucumber`
			end
			
		else
			# unit test example
			@output_unit = `ruby -Itest credit_cards_test.rb`	
			@info = /(\d+) tests, (\d+) assertions, .*(\d+) failures, .*(\d+) errors, .*(\d+) skips/.match(@output_unit)
		end
	end
  end
  
  def index
	@repos = `ls repositories`
	@repos = @repos.split(" ").sort
  end
end
