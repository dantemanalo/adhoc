class ItemPeril < ApplicationRecord
  self.table_name = "gipi_itmperil"
  self.primary_key = "item_no"

  alias_attribute :premium, :prem_amt

  belongs_to :item, foreign_key: :policy_id
  has_one :peril, foreign_key: :peril_cd

  def total_premium_rate(policy)
    ItemPeril.where(policy_id: policy.policy_id).sum(:prem_rt)
  end
end
