class CommissionInvoice < ApplicationRecord
  self.table_name = "gipi_comm_invoice"
  self.primary_key = "intrmdry_intm_no"

  alias_attribute :intm_no, :intrmdry_intm_no

  has_one :intermediary, foreign_key: :intm_no
  belongs_to :policy, foreign_key: :policy_id

  def premium
    if policy.spoiled_acct_ent_date.present?
      self.premium_amt * -1
    else
      self.premium_amt
    end
  end
end
