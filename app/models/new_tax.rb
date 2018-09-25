class NewTax < ApplicationRecord
  self.table_name = "giex_new_group_tax"
  self.primary_key = "policy_id"

  alias_attribute :description, :tax_desc
  alias_attribute :amount, :tax_amt

  belongs_to :policy, foreign_key: :policy_id
  has_many :old_taxes, foreign_key: :policy_id, primary_key: :policy_id

  def type
    case tax_cd
    when 1 then "DOC STAMPS"
      when 2 then "NST"
      when 3 then "EVAT"
      when 4 then "PREMIUM TAX"
      when 5 then "FST"
      when 6 then "LOCAL GOV TAX"
      when 7 then "NF"
      when 8 then "OC"
      when 21 then "DI"
      when 22 then "IR"
      when 23 then "SF"
      when 29 then "COCVF"
    end
  end
end
