class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :desc

      t.references :user
      t.references :project
      
      t.timestamps
    end
  end
end
