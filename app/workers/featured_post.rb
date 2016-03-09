class FeaturedPost
  def perform
    ummark_featured_post

  	mark_featured_post
  end

  def ummark_featured_post
  	featured_post = Post.find_by(:featured => true)
  	featured_post.featured = false
  	featured_post.save
  end

  def mark_featured_post
  	posts = Post.all
  	all_posts = posts.count
  	index = rand(all_posts)
  	posts[index].featured = true
  	posts[index].save
  end
end