class BoardsController < ApplicationController
  def index
    @task = Task.first
  end
end