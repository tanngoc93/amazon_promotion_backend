class SeedAffiliatePlatform < SeedMigration::Migration
  def up
    AffiliatePlatform.create(name: "Amazon's Suppliers", domain: "https://www.amazon.com/")
  end

  def down
    AffiliatePlatform.destroy_all
  end
end
