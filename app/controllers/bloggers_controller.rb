class BloggersController < ApplicationController
  
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = current_user.bloggers.new
  end

  def create
    @blogger = current_user.bloggers.new(blogger_params)
    if @blogger.save
      redirect_to @blogger
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    if @blogger.update(blogger_params)
      redirect_to @blogger
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def blogger_params
      params.require(:blogger).permit(:title, :body, :blog_image)
    end
end
