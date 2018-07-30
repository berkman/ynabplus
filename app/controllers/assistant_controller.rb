class AssistantController < ApplicationController
skip_before_action :verify_authenticity_token
http_basic_authenticate_with name: ENV['ASSISTANT_USERNAME'], password: ENV['ASSISTANT_PASSWORD']

  def main
    assistant = Hash.new
    assistant[:user] = params[:user] || nil
    assistant[:category] = params[:category] || nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => assistant}
    end
  end
end
