class PurchaseRecord < ApplicationRecord
  has_one :shipping_info
  belongs_to :user
  belongs_to :item
end