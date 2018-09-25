class Intermediary < ApplicationRecord
  self.table_name = "giis_intermediary"
  self.primary_key = "intm_no"

  alias_attribute :name, :intm_name
  alias_attribute :number, :intm_no

  belongs_to :expiry, foreign_key: :intm_no
  has_many :commission_invoices, foreign_key: :intm_no
  has_many :policies, through: :commission_invoices, foreign_key: :policy_id

  def billing_address
    "#{bill_addr1} #{bill_addr2} #{bill_addr3}"
  end
end
