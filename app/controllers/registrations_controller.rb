class RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)
    meth = params[:user][:password].present? ? :update_attributes : :update_without_password

    if @user.send(meth, params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

end

