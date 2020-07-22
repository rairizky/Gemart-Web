class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    role = ['admin', 'supplier', 'gerai']
    role.each do |c|
      Role.create! do |item|
        item.name = c
      end
    end
  end
end
