class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string  :title, null: false
      t.integer :price, null: false
      t.text    :info, null: false
      t.integer :category_id , null: false
      t.integer :item_status_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :prefecture_id, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
