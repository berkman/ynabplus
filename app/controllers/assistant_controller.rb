class AssistantController < ApplicationController
skip_before_action :verify_authenticity_token
http_basic_authenticate_with name: 'username', password: 'password'

  def main
    @assistant_user = params[:user] || nil
    @assistant_category = params[:category] || nil
    puts @assistant_user
  end
end
