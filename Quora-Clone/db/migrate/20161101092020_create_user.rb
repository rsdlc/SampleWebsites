class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t| 
      t.string :name
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :img
      t.boolean :category
    end
  end
end
