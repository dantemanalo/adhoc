class Invoice < ApplicationRecord

  self.table_name = "gipi_invoice"
  self.primary_key = "prem_seq_no"
	# self.primary_key = "policy_id"

	alias_attribute :issue_code, :iss_cd
  alias_attribute :pol_id, :policy_id

  has_many :invoice_taxes, foreign_key: :prem_seq_no
  # has_many :invoice_taxes, foreign_key: :iss_cd
  belongs_to :policy, foreign_key: :policy_id

end
