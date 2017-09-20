class Invoice < ApplicationRecord

  self.table_name = "gipi_invoice"
	self.primary_key = "policy_id"

	alias_attribute :iss_code, :iss_cd
  alias_attribute :prem_sequence_no, :prem_seq_no

  belongs_to :policy, foreign_key: :policy_id

  has_many :invoice_taxes, foreign_key: :iss_cd
  has_many :invoice_taxes, foreign_key: :prem_seq_no
end
