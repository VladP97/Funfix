class ThemesController < PersonsController
  def edit
    User.update(params[:id], theme: params[:theme]).save
    redirect_to person_path(params[:id])
  end
end