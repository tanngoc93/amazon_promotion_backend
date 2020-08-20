class Supplier < ApplicationRecord
  has_many :coupons
  validates :name, uniqueness: true, presence: true
end
