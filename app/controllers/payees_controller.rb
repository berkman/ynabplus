require 'ynab'

class PayeesController < ApplicationController
  def main
    access_token = ENV['YNAB_ACCESS']

    ynab_api = YNAB::API.new(access_token)

    budget_id = 'feeabd09-6519-45a8-a27d-fec0ad1a46a2'

    payee_response = ynab_api.payees.get_payees(budget_id)
    @payees = payee_response.data.payees
  end
end
