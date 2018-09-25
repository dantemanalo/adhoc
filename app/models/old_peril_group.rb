class OldPerilGroup < ApplicationRecord
  self.table_name = "giex_old_group_peril"
  self.primary_key = "policy_id"

  alias_attribute :premium, :prem_amt
  alias_attribute :tsi_amount, :tsi_amt
  alias_attribute :linecode, :line_cd

  belongs_to :policy, foreign_key: :policy_id, primary_key: :policy_id
  has_many :perils, foreign_key: :peril_cd, primary_key: :peril_cd

  def total_premium(policy)
    OldPerilGroup.where(policy_id: policy.policy_id).sum(:premium)
  end
end
