class PersonsController < ApplicationController
  def index
    @users = User.all.to_a
  end

  def show
    @fanfics = Fanfic.where(user_id: current_user.id).to_a
  end
end
