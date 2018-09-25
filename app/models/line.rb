class Line < ApplicationRecord
  self.table_name = "giis_line"
  self.primary_key = "line_cd"

  alias_attribute :linename, :line_name
  alias_attribute :linecode, :line_cd

  belongs_to :expiry, foreign_key: :line_cd
  belongs_to :policy, foreign_key: :line_cd
  has_many :claims, foreign_key: :line_cd
end
