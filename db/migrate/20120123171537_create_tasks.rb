class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :desc
      t.enum :status
      t.integer :priority
      
      t.datetime :due

      t.references :assigned
      t.references :author
      t.references :list
      
      t.timestamps
    end
  end
end
