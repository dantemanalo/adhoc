class DistributionShare < ApplicationRecord
  self.table_name = "giis_dist_share"
  self.primary_key = "share_cd"

  alias_attribute :linecode, :line_cd
  alias_attribute :sharecode, :share_cd

  belongs_to :item_peril_detail, foreign_key: :share_cd
end
