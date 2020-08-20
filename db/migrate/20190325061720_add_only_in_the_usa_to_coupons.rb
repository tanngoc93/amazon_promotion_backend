class AddOnlyInTheUsaToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :only_in_the_usa, :boolean, default: false
  end
end
