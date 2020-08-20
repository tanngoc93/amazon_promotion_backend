class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name, null: false, unique: true
      t.string :code, null: false, unique: true
      t.text   :description
      t.string :link, null: false, unique: true
      t.datetime :starts_at
      t.datetime :expires_at
      t.boolean :ended_before_deadline, default: false
      t.string  :starts_at_as_string
      t.string  :expires_at_as_string
      t.integer :status, default: 0
      t.float   :discount_rate, default: 0
      t.integer :discount_rate_type, default: 0
      t.integer :number_of_clicks, default: 0
      t.integer :supplier_id
      t.integer :product_category_id
      t.integer :affiliate_platform_id
      t.integer :report_systems_count, default: 0

      t.timestamps
    end
  end
end