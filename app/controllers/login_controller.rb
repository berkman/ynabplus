require 'omniauth-oauth'

class LoginController < ApplicationController
  def main
    @code = params[:code]
  end

  def callback
  end
end
