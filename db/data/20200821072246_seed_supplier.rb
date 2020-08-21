class SeedSupplier < SeedMigration::Migration
  def up
    Supplier.create!(name: "Amazon's Suppliers", domain: "https://www.amazon.com/")
  end

  def down
    Supplier.destroy_all
  end
end
