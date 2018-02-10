class CommentsController < ActionController::Base
  def new
    Comment.create(user_id: params[:user_id],
                   fanfic_id: params[:fanfic_id],
                   comment: params[:comment])
  end

  def create
    comment = Comment.new comment: params[:comment][:comment],
                          fanfic_id: params[:comment][:fanfic_id],
                          user_id: current_user.id
    if comment.save
      ActionCable.server.broadcast 'comments',
                                   message: comment.comment,
                                   user: comment.user.login
      head :ok
    else
      redirect_to read_fanfic_read_chapters
    end
  end
end