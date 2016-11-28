class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t| 
      t.belongs_to :option, index: true
      t.belongs_to :response, index: true
    end
  end
end
