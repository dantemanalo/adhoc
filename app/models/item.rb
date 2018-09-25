class Item < ApplicationRecord
  self.table_name = "gipi_item"
  self.primary_key = "item_no"

  belongs_to :policy, foreign_key: :policy_id
  has_many :item_perils, foreign_key: :policy_id
end
