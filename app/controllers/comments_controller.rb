class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    
 ## @comment = @prototype.comments.new(comment_params)ではダメな理由。
    
  if @comment.save
      redirect_to prototype_path(@prototype)
  else
    render 'prototypes/show'
    ## render template:'prototypes/show' の省略だが、他にやりようがあるか。
  end

  end


  private

  def comment_params
    params.permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end