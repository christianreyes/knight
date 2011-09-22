class HomeController < ApplicationController
  def grade
	Dir.chdir("repositories/#{params[:reponame]}") do
		if Dir.entries(Dir.pwd).include?("app") && Dir.entries(Dir.pwd).include?("public")
			# rails application
			@output = `cucumber`	
		else
			# unit test example
			@output = `ruby -Itest credit_cards_test.rb`	
			@info = /(\d+) tests, (\d+) assertions, (\d+) failures, (\d+) errors, (\d+) skips/.match(@output)
		end
	end
  end
  
  def index
	@repos = `ls repositories`
	@repos = @repos.split(" ").sort
  end
end
