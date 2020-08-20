class DeleteReportSystemsCountToCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_column :coupons, :report_systems_count
  end
end
