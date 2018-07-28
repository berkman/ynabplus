require 'ynab'

class BudgetsController < ApplicationController
  def main
    ynab_api = YNAB::API.new(session[:access_token])

    budgets_response = ynab_api.budgets.get_budgets
    @budgets = budgets_response.data.budgets
  end
end
