class Invoice < ApplicationRecord
  self.table_name = "gipi_invoice"
  self.primary_key = "prem_seq_no"

  alias_attribute :net_premium, :prem_amt
  alias_attribute :total_taxes, :tax_amt
  alias_attribute :duedate, :due_date
  alias_attribute :issue_code, :iss_cd

  belongs_to :policy, foreign_key: :policy_id
  has_many :invoice_taxes, foreign_key: :prem_seq_no

  def gross_premium
    net_premium.to_s.to_d + total_taxes.to_s.to_d
  end

end
