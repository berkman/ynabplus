require 'ynab'

class AccountsController < ApplicationController
  def index
    #if !session[:accounts]
      budget = session[:budgets].first
      logger.debug budget.to_yaml

      ynab_api = YNAB::API.new(current_user.oauth_token)

      accounts_response = ynab_api.accounts.get_accounts(budget['id'])
      @accounts = accounts_response.data.accounts

      #session[:accounts] = @accounts
    #else
    #end
  end

  def show
  end
end
