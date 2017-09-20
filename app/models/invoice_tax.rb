class InvoiceTax < ApplicationRecord

  self.table_name = "gipi_inv_tax"
	self.primary_key = "prem_seq_no"

	alias_attribute :iss_code, :iss_cd
  alias_attribute :tax_code, :tax_cd
  alias_attribute :tax_amount, :tax_amt

  belongs_to :invoice, foreign_key: :iss_cd
  belongs_to :invoice, foreign_key: :prem_seq_no

  def docstamp
    if tax_code = 1
      then tax_amount
    else tax_amount = 0
    end
  end
end
