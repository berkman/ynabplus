require 'ynab'

class PayeesController < ApplicationController
  def main
    access_token = ENV['YNAB_ACCESS']

    ynab_api = YNAB::API.new(access_token)

    budget_id = ENV['YNAB_BUDGET_IT']

    payee_response = ynab_api.payees.get_payees(budget_id)
    @payees = payee_response.data.payees
  end
end
