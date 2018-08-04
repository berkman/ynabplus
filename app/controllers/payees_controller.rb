require 'ynab'

class PayeesController < ApplicationController
  def main
    budget_id = ENV['YNAB_BUDGET_ID']

    ynab_api = YNAB::API.new(current_user.oauth_token)

    payee_response = ynab_api.payees.get_payees(budget_id)
    @payees = payee_response.data.payees
  end
end
