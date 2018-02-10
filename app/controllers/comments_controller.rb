class CommentsController < ActionController::Base
  def new
    Comment.create(user_id: params[:user_id],
                   fanfic_id: params[:fanfic_id],
                   comment: params[:comment])
  end

  def create
    message = Comment.new comment: params[:comment][:comment],
                          fanfic_id: params[:comment][:fanfic_id],
                          user_id: current_user.id
    if message.save
      # do some stuff
    else
      redirect_to read_fanfic_read_chapters
    end
  end
end