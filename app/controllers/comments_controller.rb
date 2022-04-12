class CommentsController < ApplicationController
  #befor_action :authenticate_user!

  def create 
    @blogger = Blogger.find(params[:blogger_id])
    @comment = @blogger.comments.create(comment_params)
    redirect_to blogger_path(@blogger)
  end

  def destroy
    @blogger = Blogger.find(params[:blogger_id])
    @comment = @blogger.comments.find(params[:id])
    @comment.destroy
    redirect_to blogger_path(@blogger), status: 303
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end


