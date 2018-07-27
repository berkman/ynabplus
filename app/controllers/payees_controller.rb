require 'ynab'

class PayeesController < ApplicationController
  def main
    access_token = ENV['YNAB_ACCESS']
    budget_id = ENV['YNAB_BUDGET_ID']

    #puts @user.find()

    ynab_api = YNAB::API.new(@user.access_token)

    payee_response = ynab_api.payees.get_payees(budget_id)
    @payees = payee_response.data.payees
  end
end
