class Api::PostsController < ApiController
  def index
    meetup = Meetup.find(params[:meetup_id])
    posts = meetup.posts
    posts = posts.map do |post|
    {
      id: post.id,
      meetup_id: meetup.id,
      user_id: post.user.id,
      user: post.user,
      body: post.body
    }
    end
    render json: { posts: posts }, status: :ok
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      render json: { post: post, user: post.user }, status: :created
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    render json: { post: post }
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :meetup_id)
  end
end
