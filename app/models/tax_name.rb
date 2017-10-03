class TaxName < ApplicationRecord
  self.table_name = "giis_tax_charges"
  self.primary_key = "tax_cd"

  alias_attribute :name, :tax_desc

  has_many :invoice_taxes, foreign_key: :tax_cd
end
