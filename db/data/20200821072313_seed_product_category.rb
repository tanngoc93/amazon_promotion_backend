class SeedProductCategory < SeedMigration::Migration
  def up
    ProductCategory.create!(name: "Grocery & Gourmet Food")
    ProductCategory.create!(name: "Health & Household")
    ProductCategory.create!(name: "Kitchen & Dining")
    ProductCategory.create!(name: "Pet Food & Supplies")
  end

  def down
    ProductCategory.destroy_all
  end
end
