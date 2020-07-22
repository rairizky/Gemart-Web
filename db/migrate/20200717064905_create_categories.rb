class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    category = ['sandang', 'pangan', 'papan']
    category.each do |c|
      Category.create! do |item|
        item.name = c
      end
    end
  end
end
