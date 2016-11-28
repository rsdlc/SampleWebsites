class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.belongs_to :order, index: true  
      t.string :flavor
      t.string :size
      t.string :instructions
    end
  end
end
