class CouponStatusWorker
  include Sidekiq::Worker

  def perform(id)
    coupon = Coupon.find_by(id: id)

    if coupon.present?
      if coupon.upcoming?
        update_coupon_status(coupon, :currently_active)
      else
        update_coupon_status(coupon, :expired)
      end
    end
  end

  private

  def update_coupon_status(coupon, status)
    coupon.update(status: status)
  end
end
