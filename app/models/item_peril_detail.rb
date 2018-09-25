class ItemPerilDetail < ApplicationRecord
  self.table_name = "giuw_itemperilds_dtl"
  self.primary_key = "peril_cd"

  alias_attribute :code, :peril_cd
  alias_attribute :linecode, :line_cd

  has_one :peril, foreign_key: :peril_cd
  has_one :policy_distribution, foreign_key: :dist_no
  has_one :policy, through: :policy_distribution, foreign_key: :dist_no
  has_many :distribution_shares, foreign_key: :share_cd
end
