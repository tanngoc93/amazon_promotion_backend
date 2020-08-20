class AddSiteStripeToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :site_stripe_content, :text
    add_column :coupons, :site_stripe, :boolean, default: false
  end
end
