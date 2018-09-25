class PolicyDistribution < ApplicationRecord
  self.table_name = "giuw_pol_dist"
  self.primary_key = "dist_no"

  alias_attribute :flag, :dist_flag
  alias_attribute :number, :dist_no

  belongs_to :policy, foreign_key: :policy_id
  belongs_to :item_peril_detail, foreign_key: :dist_no

  FLAG = ['3', '4']
end
