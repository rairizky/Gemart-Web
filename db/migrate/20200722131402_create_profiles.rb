class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :image
      t.date :dob
      t.string :gender
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
