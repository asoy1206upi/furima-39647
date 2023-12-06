class CreateItemImages < ActiveRecord::Migration[7.0]
  def change
    create_table :item_images do |t|
      t.references :item, null: false, foreign_key: true
      t.blob :image

      t.timestamps
    end
  end
end
