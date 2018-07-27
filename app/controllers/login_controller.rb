require 'net/http'
require 'uri'
require 'json'

class LoginController < ApplicationController
  def main
    @ynab_code = params[:code]
    @ynab_id = ENV['YNAB_ID']
    @ynab_secret = ENV['YNAB_SECRET']
    @ynab_redirect = ENV['YNAB_REDIRECT']
    # TODO: state for CSRF

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

    @ynab_token = data["access_token"] || nil
  end
end
