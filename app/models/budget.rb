class Budget < ApplicationRecord
  belongs_to :user

  def self.from_ynab(ynab_budget_id, ynab_budget_name, uid)
    where(budget_id: ynab_budget_id, user_id: uid).first_or_initialize.tap do |budget|
      budget.budget_id = ynab_budget_id
      budget.name = ynab_budget_name
      budget.user_id = uid
      budget.save!
    end
  end
end
