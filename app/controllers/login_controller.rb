require 'omniauth-oauth'

class LoginController < ApplicationController
  def main
    @ynab_code = params[:code]
    @ynab_id = ENV['YNAB_ID']
    @ynab_secret = ENV['YNAB_SECRET']
    @ynab_redirect = ENV['YNAB_REDIRECT']

    @ynab_token = params[:access_token]

    @auth = "https://app.youneedabudget.com/oauth/token?client_id=#{@ynab_id}&client_secret=#{@ynab_secret}&redirect_uri=#{@ynab_redirect}&grant_type=authorization_code&code=#{@ynab_code}"
  end

  def callback
  end
end
