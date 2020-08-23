class Api::V1::CouponsController < Api::V1::ApiController
  skip_before_action :authenticate!, only: [:index]

  def index
    coupons = Coupon.by_category(params[:category_id]).page(page).per(per)

    render json: {
      coupons: array_json(coupons, CouponSerializer),
      meta: meta_attributes(coupons)
    }, status: 200
  end

  def destroy
    coupon = Coupon.find_by_id(params[:id])
    coupon.update(ended_before_deadline: true) unless coupon.nil?
    render json: {}, status: 200
  end
end