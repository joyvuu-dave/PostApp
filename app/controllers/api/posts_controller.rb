module Api
  class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    DEFAULT_LIMIT = 10

    # GET /api/posts
    def list
      posts = Post.limit(DEFAULT_LIMIT).order('created_at DESC')
      render json: posts
    end

    # POST /api/posts
    # params => post: { title: String, content: Text, author_id: Integer }
    def create
      post = Post.new(post_params)
      if post.save
        render json: post 
      else
        render json: { error: 'Post could not be created', status: :unprocessible_entity }
      end
    end

    # GET /api/posts/:id
    def show
      post = Post.find_by_id(params[:id])
      if post 
        render json: post 
      else
        render json: { error: 'Post not found', status: :unprocessible_entity }
      end
    end

    # PATCH /api/posts/:id
    def update
      post = Post.find_by_id(params[:id])
      if post.update_attributes(post_params)
        render json: post 
      else
        render json: { error: 'Post could not be updated', status: :unprocessible_entity }
      end
    end

    # DELETE /api/posts/:id
    def destroy
      post = Post.find_by_id(params[:id])
      if post.destroy
        render json: { message: 'Post deleted', status: :ok }
      else
        redner json: { error: 'Post could not be destroyed', status: :unprocessible_entity }
      end
    end

    private 

      def post_params
        params.require(:post).permit(:title, :content, :author_id)
      end
  end
end
