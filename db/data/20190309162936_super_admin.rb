class SuperAdmin < SeedMigration::Migration
  def up
    AdminUser.create!(email: "sys.manager@sys.com", password: "iWJlNoCQWBvijhWc", password_confirmation: "iWJlNoCQWBvijhWc")
  end

  def down
    AdminUser.destroy_all
  end
end
