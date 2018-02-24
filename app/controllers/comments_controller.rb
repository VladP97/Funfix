class CommentsController < ActionController::Base
  def create
    comment = Comment.new comment: params[:comment][:comment],
                          fanfic_id: params[:comment][:fanfic_id],
                          user_id: current_user.id
    comment.save
    update_comments(comment)
  end

  def update
    if !Like.where(user_id: current_user.id, comment_id: params[:id]).any?
      if current_user
        comment = Comment.find(params[:id])
        comment.likes += 1
        comment.save
        Like.create comment_id: params[:id], user_id: current_user.id
        update_comments(comment)
      end
    end
  end

  private

  def update_comments(comment)
    ActionCable.server.broadcast 'comments',
                                 message: comment.comment,
                                 likes: comment.likes,
                                 user: comment.user.login,
                                 id: comment.id
    head :ok
  end
end