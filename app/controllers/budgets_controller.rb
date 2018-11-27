require 'ynab'

class BudgetsController < ApplicationController
  def main
    ynab_api = YNAB::API.new(current_user.oauth_token)

    budgets_response = ynab_api.budgets.get_budgets
    @budgets = budgets_response.data.budgets

    session[:budgets] = @budgets

    @budgets.each do |budget|
      Budget.from_ynab(budget.id, budget.name, current_user.id)
    end
  end
end
