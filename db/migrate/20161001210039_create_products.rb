class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.json :item_specifics
      t.json :user_specifics
      t.string :description

      t.timestamps
    end
  end
end
