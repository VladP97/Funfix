class PersonsController < ApplicationController
  def index
    @users = User.all.to_a
  end
  
  def show
    if current_user.admin_role
      @fanfics = Fanfic.where(user_id: params[:id]).to_a
    else
      @fanfics = Fanfic.where(user_id: current_user.id).to_a
    end
  end

  def update
    set_admin(params)
    redirect_to controller: "persons", action: "index"
  end

  private

  def set_admin(params)
    if params[:admin_role] || params[:user_role]
      User.update(params[:id], admin_role: params[:admin_role], user_role: params[:user_role])
    end
  end
end
