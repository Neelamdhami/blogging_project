class CreateBloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :bloggers do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
