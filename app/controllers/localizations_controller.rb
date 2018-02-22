class LocalizationsController < PersonsController
  def edit
    User.update(params[:id], locale: params[:localization]).save
    redirect_to person_path(params[:id])
  end
end