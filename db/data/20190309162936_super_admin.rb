class SuperAdmin < SeedMigration::Migration
  def up
    AdminUser.find_by_email('s3consum@thedogpaws.com').try(:delete)

    AdminUser.create! do |r|
      r.email                   = 's3consum@thedogpaws.com'
      r.password                = 'M<YkZB5z&E:)&KV='
      r.password_confirmation   = 'M<YkZB5z&E:)&KV='
    end
  end

  def down
    AdminUser.find_by_email('s3consum@thedogpaws.com').try(:delete)
  end
end
