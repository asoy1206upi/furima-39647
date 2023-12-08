class RemoveContentFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :content, :string
  end
end
