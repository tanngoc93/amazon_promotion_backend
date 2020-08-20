class AddShortLinkToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :short_link, :string
  end
end
