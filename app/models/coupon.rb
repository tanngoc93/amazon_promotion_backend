class Coupon < ApplicationRecord
  paginates_per 10

  acts_as_taggable

  belongs_to :supplier
  belongs_to :product_category
  belongs_to :affiliate_platform

  enum discount_rate_type: [
    :cash,
    :percentage,
    :unknow
  ]

  enum status: [
    :upcoming,
    :currently_active,
    :expired
  ]

  validate  :timeline_valid
  validates :name, :code, uniqueness: true
  validates :name, :code, :link, :starts_at, :expires_at, :discount_rate,
            :discount_rate_type, :supplier, :product_category, :affiliate_platform, presence: true

  default_scope {
    where(ended_before_deadline: false).order(expires_at: :asc)
  }

  scope :by_category, -> (id) do
    if id.eql?("any")
      currently_active
    else
      where(product_category_id: id).currently_active
    end
  end

  before_save :set_status
  after_save  :set_scheduled

  def test_link
    link[/[^\?]+/]
  end

  private

  def timeline_valid
    return if starts_at.nil? || expires_at.nil?

    if starts_at >= expires_at
      errors.add(:starts_at, 'There was an error setting the timeline!')
      errors.add(:expires_at, 'There was an error setting the timeline!')
    end
  end

  def set_status
    self.status =
      if expired?
        :expired
      else
        starts_at.future? ? :upcoming : :currently_active
      end
  end

  def set_scheduled
    if ended_before_deadline? || expired?
      remove_scheduled! and return
    end

    remove_scheduled! and create_scheduled!
  end

  def create_scheduled!
    CouponStatusWorker.perform_at(scheduled_time, id)
  end

  def remove_scheduled!
    ss = Sidekiq::ScheduledSet.new
    ss.select do |scheduled|
      scheduled.klass == 'CouponStatusWorker' && scheduled.args[0] == id
    end.map(&:delete)
  end

  def scheduled_time
    starts_at.future? ? starts_at : expires_at
  end

  def expired?
    starts_at.past? && expires_at.past?
  end
end
