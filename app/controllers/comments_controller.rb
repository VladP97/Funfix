class CommentsController < ActionController::Base
  def new
    p params
    Comment.create(user_id: params[:user_id],
                   fanfic_id: params[:fanfic_id],
                   comment: params[:comment])
  end
end