class AddEnableToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :enable, :boolean, default: true
  end
end
