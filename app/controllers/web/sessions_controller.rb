class Web::SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_logged_in!, except: :destroy

  def new
    @sign_in = SignIn.new
  end

  def create
    @sign_in = SignIn.new(sign_in_params)

    if @sign_in.valid?
      sign_in(@sign_in.user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end
end
