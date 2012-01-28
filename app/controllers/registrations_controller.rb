class RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)
    if @user.update_without_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

end

