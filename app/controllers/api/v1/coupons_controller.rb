class Api::V1::CouponsController < Api::V1::ApiController
  skip_before_action :authenticate!, only: [:index]
  before_action :set_product_category, only: [:index]

  def index
    coupons = Coupon.by_category(@product_category).page(page).per(per)

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

  private

  def set_product_category
  	@product_category = ProductCategory.find_by_id(params[:category_id] || 1)
  end
end