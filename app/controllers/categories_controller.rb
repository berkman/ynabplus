require 'ynab'

class CategoriesController < ApplicationController
  def main
    budget_id = ENV['YNAB_BUDGET_ID']

    ynab_api = YNAB::API.new(session[:access_token])

    category_groups_response = ynab_api.categories.get_categories(budget_id)
    @category_groups = category_groups_response.data.category_groups
  end
end
