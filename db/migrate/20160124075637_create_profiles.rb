class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender, limit: 6
      t.decimal :birth_year, precision: 4
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
