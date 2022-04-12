module ApplicationHelper

	def user_image
		current_user.avatar.url rescue "https://picsum.photos/200/300"
	end

  def blog_owner(blog)
    current_user.id == blog.user_id
  end

end
