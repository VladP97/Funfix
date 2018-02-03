class PersonsController < ApplicationController
  def index

  end

  def show
    @fanfics = Fanfic.where(user_id: current_user.id).to_a
  end
end
