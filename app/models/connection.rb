class Connection < ApplicationRecord
  has_many :interactions
  belongs_to :list
end
