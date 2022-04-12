class AddUserIdToBloggers < ActiveRecord::Migration[7.0]
  def change
    add_column :bloggers, :user_id, :integer
    add_index :bloggers, :user_id
    add_column :bloggers, :blog_image, :string
  end
end
