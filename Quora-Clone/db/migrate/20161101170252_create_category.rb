class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t| 
      t.string :name
      t.integer :n_questions
      t.integer :n_folowers
    end
  end
end
