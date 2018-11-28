require 'ynab'

class MonthsController < ApplicationController
  def index
    @budget = current_user.budgets.first

    ynab_api = YNAB::API.new(current_user.oauth_token)

    months_response = ynab_api.months.get_budget_months(@budget.budget_id)
    @months = months_response.data.months
  end
end
