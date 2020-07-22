class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role_id

      t.timestamps
    end

    User.create! do |u|
      u.username = 'admingemart'
      u.email = 'admin@gemart.com'
      u.password = 'admingemart'
      u.role_id = 1
    end
  end
end
