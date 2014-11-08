class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.boolean :is_sell, default: true
      t.references :category

      t.timestamps
    end
  end
end
