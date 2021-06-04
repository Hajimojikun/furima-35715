class CreateWhereTos < ActiveRecord::Migration[6.0]
  def change
    create_table :where_tos do |t|

      t.string  :post_code,            null: false
      t.string  :city,                 null:false
      t.string  :street,               null:false
      t.string  :name_of_the_building
      t.string  :phone_number,         null:false
      t.integer :prefecture_id,        null: false
      t.references :buy_item,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
