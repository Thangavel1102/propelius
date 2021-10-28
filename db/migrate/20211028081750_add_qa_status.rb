class AddQaStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :qa_status, :string
  end
end
