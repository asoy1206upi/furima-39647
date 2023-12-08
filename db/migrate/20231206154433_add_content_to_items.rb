class AddContentToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :content, :string
  end
end
