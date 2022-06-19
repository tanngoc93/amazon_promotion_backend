class SuperAdmin < SeedMigration::Migration
  def up
    User.create(email: "admin@admin.com", password: "iWJlNoCQWBvijhWc", password_confirmation: "iWJlNoCQWBvijhWc")
  end

  def down
    User.destroy_all
  end
end
