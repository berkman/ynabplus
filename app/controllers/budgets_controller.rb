require 'ynab'

class BudgetsController < ApplicationController
  def index
    if !session[:budgets]
      ynab_api = YNAB::API.new(current_user.oauth_token)

      budgets_response = ynab_api.budgets.get_budgets
      @budgets = budgets_response.data.budgets

      session[:budgets] = @budgets

=begin
      # create an object but dont persist to the database
            @budgets.each do |budget|
              Budget.from_ynab(budget.id, budget.name, current_user.id)
            end
=end
    #else
      #@budgets = session[:budgets]
    end
  end

  def show
  end
end
