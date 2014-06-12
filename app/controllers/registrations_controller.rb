class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    if params[:user]["birthday(1i)"]
      date = Date.new(params[:user]['birthday(1i)'].to_i, params[:user]['birthday(2i)'].to_i, params[:user]['birthday(3i)'].to_i)
      @user.birthday = date
    end
    params[:user].delete("birthday(1i)")
    params[:user].delete("birthday(2i)")
    params[:user].delete("birthday(3i)")

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to :back
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    params[:user][:password].present?
  end
end
