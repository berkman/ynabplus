require 'ynab'

class AccountsController < ApplicationController
  def main
    @budget = current_user.budgets.first

    ynab_api = YNAB::API.new(current_user.oauth_token)

    accounts_response = ynab_api.accounts.get_accounts(@budget.budget_id)
    @accounts = accounts_response.data.accounts
  end
end
