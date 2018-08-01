class AssistantController < ApplicationController
skip_before_action :verify_authenticity_token
http_basic_authenticate_with name: ENV['ASSISTANT_USERNAME'], password: ENV['ASSISTANT_PASSWORD']

  def main
    assistant_request = Hash.new
    assistant_request[:responseId] = params[:responseId] || nil
    assistant_request[:queryResult] = params[:queryResult] || nil
    assistant_request[:originalDetectIntentRequest] = params[:originalDetectIntentRequest] || nil
    assistant_request[:session] = params[:session] || nil


    assistant_response = Hash.new
    assistant_response[:fulfillmentText] = "This is the response!!!!!!"

    #assistant_response[:responseId] = assistant_request[:responseId]
    #assistant_response[:queryResult] ||= {}
    #assistant_response[:queryResult][:queryText] = assistant_request[:queryResult][:queryText]
    #assistant_response[:queryResult][:action] = assistant_request[:queryResult][:action]
    #assistant_response[:queryResult][:parameters] = assistant_request[:queryResult][:parameters]
    #assistant_response[:queryResult][:allRequiredParamsPresent] = assistant_request[:queryResult][:allRequiredParamsPresent]

    # json array
    assistant_response[:fulfillmentMessages] ||= []
    assistant_response[:fulfillmentMessages][0] ||= {}

    assistant_response[:fulfillmentMessages][0][:card] ||= {}
    assistant_response[:fulfillmentMessages][0][:card][:title] = "Card Title"
    assistant_response[:fulfillmentMessages][0][:card][:subtitle] = "This is the body text of a card."
    assistant_response[:fulfillmentMessages][0][:card][:imageUri] = "https://developers.google.com/actions/images/badges/XPM_BADGING_GoogleAssistant_VER.png"

    # json array
    #assistant_response[:fulfillmentMessages][:card][:buttons] ||= {}
    #assistant_response[:fulfillmentMessages][:card][:buttons][:text] = "This is a button"
    #assistant_response[:fulfillmentMessages][:card][:buttons][:postback] = "https://assistant.google.com/"

    # json array
    #assistant_response[:queryResult][:fulfillmentMessages][:quickReplies] ||= {}
    #assistant_response[:queryResult][:fulfillmentMessages][:quickReplies][:quickReplies] = "derp", "Suggestion"

    # json array
    #assistant_response[:queryResult][:outputContexts] ||= {}

    #assistant_response[:queryResult][:intent] ||= {}
    #assistant_response[:queryResult][:intentDetectionConfidence] = assistant_request[:queryResult][:intentDetectionConfidence]
    #assistant_response[:queryResult][:diagnosticInfo] ||= {}
    #assistant_response[:queryResult][:languageCode] = assistant_request[:queryResult][:languageCode]
    #assistant_response[:webhookStatus] ||= {}
    #assistant_response[:webhookStatus][:message] = "Webhook execution successful"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => assistant_response}
    end
  end
end
