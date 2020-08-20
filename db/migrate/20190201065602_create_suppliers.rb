class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false, unique: true
      t.string :domain, null: false, unique: true
      t.text :description

      t.timestamps
    end
  end
end