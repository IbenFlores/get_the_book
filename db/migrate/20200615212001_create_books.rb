class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.string :author
      t.integer :price
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
