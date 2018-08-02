require 'ynab'

class AssistantController < ApplicationController
skip_before_action :verify_authenticity_token
http_basic_authenticate_with name: ENV['ASSISTANT_USERNAME'], password: ENV['ASSISTANT_PASSWORD']

  def main
    access_token = ENV['YNAB_ACCESS']
    budget_id = ENV['YNAB_BUDGET_ID']

    ynab_api = YNAB::API.new(access_token)

    category_groups_response = ynab_api.categories.get_categories(budget_id)
    @category_groups = category_groups_response.data.category_groups

    assistant_request = Hash.new
    assistant_request[:responseId] = params[:responseId] || nil
    assistant_request[:queryResult] = params[:queryResult] || nil
    assistant_request[:originalDetectIntentRequest] = params[:originalDetectIntentRequest] || nil
    assistant_request[:session] = params[:session] || nil

    assistant_response = Hash.new
    assistant_response[:payload] ||= {}
    assistant_response[:payload][:google] ||= {}
    assistant_response[:payload][:google][:richResponse] ||= {}

    if assistant_request[:queryResult][:intent][:displayName] == "Default Welcome Intent"
      assistant_response[:fulfillmentText] = "Greetings! How can I assist?"
      #assistant_response[:payload][:google][:richResponse][:suggestions] ||= []
      #assistant_response[:payload][:google][:richResponse][:suggestions] << {:title => 'balance'}
      #assistant_response[:payload][:google][:richResponse][:suggestions] << {:title => 'budget'}
    elsif assistant_request[:queryResult][:intent][:displayName] == "Category Intent"
      @category_groups.sort { |a,b| a.name <=> b.name }.each do |category_group|
        category_group.categories.each do |category|

          if assistant_request[:queryResult][:parameters][:category].include? category.name
            assistant_response[:fulfillmentText] = "$"+(category.balance/1000).to_s
          end
        end
      end
    end

    #assistant_response[:fulfillmentMessages] ||= []
    #assistant_response[:fulfillmentMessages][0] ||= {}
    #assistant_response[:fulfillmentMessages][0][:card] ||= {}
    #assistant_response[:fulfillmentMessages][0][:card][:title] = "Card Title"
    #assistant_response[:fulfillmentMessages][0][:card][:subtitle] = "This is the body text of a card."
    #assistant_response[:fulfillmentMessages][0][:card][:imageUri] = "https://developers.google.com/actions/images/badges/XPM_BADGING_GoogleAssistant_VER.png"
    #assistant_response[:fulfillmentMessages][0][:card][:buttons] ||= []
    #assistant_response[:fulfillmentMessages][0][:card][:buttons][0] ||= {}
    #assistant_response[:fulfillmentMessages][0][:card][:buttons][0][:text] = "This is a button"
    #assistant_response[:fulfillmentMessages][0][:card][:buttons][0][:postback] = "https://assistant.google.com/"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => assistant_response}
    end
  end
end
