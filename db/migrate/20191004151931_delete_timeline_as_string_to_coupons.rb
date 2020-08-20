class DeleteTimelineAsStringToCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_column :coupons, :starts_at_as_string
    remove_column :coupons, :expires_at_as_string
  end
end
