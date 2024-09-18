class CommentsController < ApplicationController
  before_action :set_task

  def new
    @comment = @task.comments.build
  end

  def create
    @comment = @task.comments.build(comment_params)
    if @comment.save
      redirect_to board_task_path(@task.board, @task), notice: 'コメントを追加しました'
    else
      flash.now[:error] = 'コメントの保存に失敗しました'
      render :new
    end
  end

  private
  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end