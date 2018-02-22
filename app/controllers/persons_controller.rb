class PersonsController < ApplicationController

  before_action :check_user

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
    ban_unban(params)
    redirect_to controller: "persons", action: "index"
  end

  def destroy
    User.destroy(params[:id])
    redirect_to controller: "persons", action: "index"
  end
  
  private

  def set_admin(params)
    if params[:admin_role] || params[:user_role]
      User.update(params[:id], admin_role: params[:admin_role], user_role: params[:user_role])
    end
  end

  def ban_unban(params)
    if params[:ban_unban]
      if User.find(params[:id]).banned
        User.update(params[:id], banned: 0)
      else
        User.update(params[:id], banned: 1)
      end
    end
  end

  def check_user
    if params[:id] != current_user.id && !current_user.admin_role
      redirect_to root_path
    end
  end
end
