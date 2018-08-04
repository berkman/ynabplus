require 'ynab'

class MonthsController < ApplicationController
  def main
    budget_id = ENV['YNAB_BUDGET_ID']

    ynab_api = YNAB::API.new(current_user.oauth_token)

    months_response = ynab_api.months.get_budget_months(budget_id)
    @months = months_response.data.months
  end
end
