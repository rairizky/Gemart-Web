class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :image
      t.string :owner
      t.integer :user_id
      t.integer :category_id
      t.text :address
      t.string :lat
      t.string :long
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
