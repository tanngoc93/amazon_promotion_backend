module ApplicationHelper
  def statuses
    Coupon.statuses.keys.map { |w| [w.humanize, w] }
  end
end
