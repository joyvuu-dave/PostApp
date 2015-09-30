module Api
  class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # GET /api/comments?post_id=<Integer>
    def list
      id = params[:post_id] || -1
      post = Post.find_by_id(id)
      if post
        comments = post.comments.arrange_serializable do |parent, children|
          CommentSerializer.new(parent, children: children)
        end
        render json: comments
      else
        render json: { error: 'Comments could not be retrieved', status: :unprocessible_entity }
      end
    end

    # POST /api/comments
    # params => comment: { body: Text, post_id: Integer, user_id: Integer, parent_id: Integer }
    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment 
      else
        render json: { error: 'Comment could not be created', status: :unprocessible_entity }
      end
    end

    # DELETE /api/comments/:id
    def destroy
      comment = Comment.find_by_id(params[:id])
      if comment.destroy
        render json: { message: 'Comment deleted', status: :ok }
      else
        render json: { error: 'Comment could not be deleted', status: :unprocessible_entity }
      end
    end

    private

      def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id, :parent_id)
      end
  end
end
