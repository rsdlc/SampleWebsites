class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t| 
      t.belongs_to :participation, index: true
    end
  end
end
