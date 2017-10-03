class Intermediary < ApplicationRecord
  self.table_name = "giis_intermediary"
  self.primary_key = "intm_no"

  alias_attribute :intermediaryname, :intm_name
  alias_attribute :intermediaryno, :intm_no

  belongs_to :expiry, foreign_key: :intm_no
end
