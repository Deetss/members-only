module PostsHelper
  def user_name(post)
    user = User.find_by(id: post.user_id)
    user.name
  end
end
