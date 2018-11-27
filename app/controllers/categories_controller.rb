require 'ynab'

class CategoriesController < ApplicationController
  def main
    @budget = current_user.budgets.first

    ynab_api = YNAB::API.new(current_user.oauth_token)

    category_groups_response = ynab_api.categories.get_categories(@budget.budget_id)
    @category_groups = category_groups_response.data.category_groups
  end
end
