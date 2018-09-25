class InvoiceTax < ApplicationRecord

  self.table_name = "gipi_inv_tax"
	self.primary_key = "prem_seq_no"

	alias_attribute :issue_code, :iss_cd
  alias_attribute :tax_code, :tax_cd
  alias_attribute :amount, :tax_amt
  alias_attribute :line_code, :line_cd

  belongs_to :invoice, foreign_key: :prem_seq_no
  belongs_to :tax_name, foreign_key: :tax_cd
end
