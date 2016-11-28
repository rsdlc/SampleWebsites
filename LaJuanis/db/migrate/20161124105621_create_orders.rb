class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :email
      t.string :telephone
      t.string :date
      t.boolean :status, default: false  
    end
  end
end
