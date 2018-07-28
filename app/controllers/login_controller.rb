require 'net/http'
require 'uri'
require 'json'
require 'ynab'

class LoginController < ApplicationController
  def main
    @ynab_code = params[:code]
    @ynab_id = ENV['YNAB_ID']
    @ynab_secret = ENV['YNAB_SECRET']
    @ynab_redirect = ENV['YNAB_REDIRECT']
    # TODO: state for CSRF

    if @ynab_code
      @param = {'client_id' => @ynab_id,
        "client_secret" => @ynab_secret,
        "redirect_uri" => @ynab_redirect,
        "grant_type" => "authorization_code",
        "code" => @ynab_code
      }

      puts @param

      uri = URI.parse('https://app.youneedabudget.com/oauth/token')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(@param)
      response = http.request(request)

      data = JSON.parse(response.body)

      puts data

      if data["access_token"]
        @ynab_token = data["access_token"]
        session[:access_token] = @ynab_token
        #@user = User.new('name' => 'mike')
        #@user.access_token = data["access_token"]
        #@user.save
        # TODO: need to save better and associate to a specific user so we can query against that user
        #The access token has an expiration, indicated by the "expires_in" value. To obtain a new access token without requiring the user to manually authorize again, you should store the "refresh_token" and then send a POST request to https://app.youneedabudget.com/oauth/token?client_id=[CLIENT_ID]&client_secret=[CLIENT_SECRET]&grant_type=refresh_token&refresh_token=[REFRESH_TOKEN].
      end
    end
  end
end
