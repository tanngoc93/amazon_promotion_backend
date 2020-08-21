class SeedProductCategory < SeedMigration::Migration
  def up
    ProductCategory.create!(name: "Pet Food & Supplies")
  end

  def down
    ProductCategory.destroy_all
  end
end
