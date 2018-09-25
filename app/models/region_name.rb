class RegionName < ApplicationRecord

  self.table_name = "giis_region"
	self.primary_key = "region_cd"

  alias_attribute :description, :region_desc

  belongs_to :policy, foreign_key: :region_cd, primary_key: :region_cd

end
