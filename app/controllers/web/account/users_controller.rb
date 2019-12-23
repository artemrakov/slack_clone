class Web::Account::UsersController < Web::Account::ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_account_users_path
    else
      redirect_to edit_account_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
