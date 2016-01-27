class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender, limit: 6
      t.integer :birth_year
      t.string :first_name

      t.timestamps null: false
    end
  end
end
