class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.boolean :is_sell, default: true
      t.boolean :price_negotiable, default: true
      t.decimal :asking_price
      t.references :category

      t.timestamps
    end
  end
end
