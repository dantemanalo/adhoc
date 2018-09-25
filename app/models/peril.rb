class Peril < ApplicationRecord
  self.table_name = "giis_peril"
  self.primary_key = "peril_cd"

  alias_attribute :code, :peril_cd
  alias_attribute :name, :peril_name
  alias_attribute :linecode, :line_cd

  belongs_to :old_peril_groups, foreign_key: :peril_cd, primary_key: :peril_cd
  belongs_to :item_peril, foreign_key: :peril_cd
  belongs_to :item_peril_detail, foreign_key: :peril_cd
end
