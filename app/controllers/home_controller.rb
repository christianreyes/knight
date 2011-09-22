class HomeController < ApplicationController
  def list
  end
  
  def index
	@repos = `ls repositories`
	@repos = @repos.split(" ").sort
  end
end
