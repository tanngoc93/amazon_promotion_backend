ActiveAdmin.register Coupon do
  menu priority: 6
  permit_params :name, :code, :link, :description, :starts_at, :expires_at, :status, :discount_rate, :tag_list, :short_link,
                :discount_rate_type, :supplier_id, :product_category_id, :affiliate_platform_id, :ended_before_deadline, :only_in_the_usa,
                :site_stripe, :site_stripe_content

  index do
    selectable_column
    column :id
    column :code
    column :status do |coupon|
      coupon.status.humanize
    end
    column :link do |coupon|
      link_to('Test URL', coupon.test_link, target: :blank)
    end
    column :starts_at
    column :expires_at
    column :site_stripe
    actions
  end

  form do |f|
    f.inputs do
      f.input :only_in_the_usa
      f.input :supplier
      f.input :product_category
      f.input :affiliate_platform
      f.input :name
      f.input :code
      f.input :short_link
      f.input :link
      f.input :tag_list, input_html: { value: coupon.tag_list.join(', ') }
      f.input :starts_at, as: :string
      f.input :expires_at, as: :string
      f.input :site_stripe, label: "Using Amazon SiteStripe?"
      f.input :site_stripe_content, input_html: { rows: 5 }
      f.input :description, input_html: { rows: 5 }
      f.input :discount_rate_type      
      if f.object.new_record?
        f.input :discount_rate, input_html: { value: "" }
      else
        f.input :discount_rate
      end
      f.input :ended_before_deadline, label: "Ended before the deadline"
    end
    f.actions
  end

  controller do
    def scoped_collection
      Coupon.unscoped
    end
  end
end
