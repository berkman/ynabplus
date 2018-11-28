require 'ynab'

class SessionsController < ApplicationController
  def create
    @auth_request = request.env["omniauth.auth"]

    ynab_api = YNAB::API.new(@auth_request.credentials.token)
    user_response = ynab_api.user.get_user()
    @ynab_user = user_response.data.user

    user = User.from_omniauth(@auth_request, @ynab_user.id)

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:budgets] = nil
    redirect_to root_path
  end
end
