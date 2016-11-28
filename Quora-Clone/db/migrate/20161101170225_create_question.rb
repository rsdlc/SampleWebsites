class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t| 
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.string :title
      t.string :body
      t.integer :likes
    end
  end
end
