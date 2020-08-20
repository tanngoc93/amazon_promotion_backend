class CouponStatusWorker
  include Sidekiq::Worker

  def perform(id)
    coupon = Coupon.find_by(id: id)

    return if coupon.nil?

    if coupon.upcoming?
      update_coupon(coupon, :currently_active)
    else
      update_coupon(coupon, :expired)
    end
  end

  private

  def update_coupon(coupon, status)
    coupon.update(status: status)
  end
end
