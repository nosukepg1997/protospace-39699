class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      render "prototypes/show", locals:{comment: @comment}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :prototype_id).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end

