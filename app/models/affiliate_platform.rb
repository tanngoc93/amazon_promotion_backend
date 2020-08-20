class AffiliatePlatform < ApplicationRecord
  has_many :coupons
  validates :name, :domain, uniqueness: true, presence: true
end
