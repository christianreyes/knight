class HomeController < ApplicationController
  def grade
	Dir.chdir("repositories/#{params[:reponame]}") do
		@output = `ruby -Itest credit_cards_test.rb`
		
		@info = /(\d+) tests, (\d+) assertions, (\d+) failures, (\d+) errors, (\d+) skips/.match(@output)
	end
  end
  
  def index
	@repos = `ls repositories`
	@repos = @repos.split(" ").sort
  end
end
