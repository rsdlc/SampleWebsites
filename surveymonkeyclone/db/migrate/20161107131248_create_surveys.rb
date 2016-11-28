class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t| 
      t.string :title
      t.belongs_to :user, index: true
    end
  end
end
