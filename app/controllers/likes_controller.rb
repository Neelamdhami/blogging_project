class LikesController < ApplicationController
    before_action :find_blogger
    before_action :find_like, only: [:destroy]
  def create
    if already_liked?
        flash[:notice] = "You can't like more than once"
    else
    @blogger.likes.create(user_id: current_user.id)
    end
    redirect_to blogger_path(@blogger)
  end
  def already_liked?
    Like.where(user_id: current_user.id, blogger_id:
    params[:blogger_id]).exists?
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to blogger_path(@blogger)
  end
  def find_like
    @like = @blogger.likes.find(params[:id])
 end
  private
  def find_blogger
    @blogger = Blogger.find(params[:blogger_id])
  end

end
