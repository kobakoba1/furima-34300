class Item < ApplicationRecord
  validates :price, presence: true
  validates :title, presence: true
  validates :concept, presence: true
  
  belongs_to :user
end