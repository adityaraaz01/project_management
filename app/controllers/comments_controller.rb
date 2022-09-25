class CommentsController < ApplicationController
  include CommentsHelper
    def create
        @comment = Comment.new(comment_params)
        @comment.body = parse_at_mentions(@comment.body)
        if @comment.save
            flash[:notice] = "Comment saved"
          redirect_to request.referrer
        else
          flash[:notice] = "Comment Not saved"
          redirect_to request.referrer
        end
    end
    def destroy
      @c_req = Comment.find_by_id(params[:id])
      @c_req.destroy
      flash[:success] = "Comment deleted"
      redirect_to request.referrer
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body, :user_id, :task_id)
    end
end
