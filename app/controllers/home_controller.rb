class HomeController < ApplicationController
  def index
    @blogs = Blogger.order(created_at: :asc)
  end
end
