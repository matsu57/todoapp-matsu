class TasksController < ApplicationController
  before_action :set_board
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tasks = @board.tasks.all
    @commenters = create_commenters_list(@tasks)
  end

  def show
    @comments = @task.comments
  end

  def new
    @task = @board.tasks.build
  end

  def create
    @task = @board.tasks.build(task_params)
    if @task.save
      redirect_to board_task_path(@board, @task), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクの保存に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: 'タスクを更新しました'
    else
      flash.now[:error] = 'タスクの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to board_tasks_path(@board), notice: '削除に成功しました'
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :eyecatch, :deadline).merge(user_id: current_user.id)
  end

  def create_commenters_list(tasks)
    tasks.each_with_object({}) do |task, hash|
      hash[task.id] = task.comments.map(&:user).uniq - [task.user]
    end
  end


end