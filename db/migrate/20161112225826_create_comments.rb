class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
