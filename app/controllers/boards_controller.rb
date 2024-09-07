class BoardsController < ActionController::Base
  def index
    @task = Task.first
  end
end