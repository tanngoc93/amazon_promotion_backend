class CouponSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description, :link, :short_link,
    :starts_at, :expires_at, :discount_rate, :discount_rate_type, :tag_list,
    :only_in_the_usa, :ended_before_deadline, :site_stripe, :site_stripe_content, :created_at, :updated_at
end
